require 'spec_helper'

describe User do

  before :each do
    @user = User.create(email:"nigel@example.com", username:"nigel", password:"123", password_confirmation:"123")
  end

  describe "association" do

    it "should have many spots" do
      expect(@user.respond_to?(:spots)).to be_true
    end

    it "should have many comments" do
      expect(@user.respond_to?(:comments)).to be_true
    end
  end

  describe "validations" do

    context "email" do
      it "is valid with an email" do
        expect(@user).to be_valid
      end
    end

    context "username" do
      it "is valid with a username" do
        expect(@user).to be_valid
      end
    end
  end

  describe "when password is provided" do

    it "is valid with password_confirmation" do
      expect(@user).to be_valid
    end

    context "when password_confirmation is empty" do
      it "is invalid without password_confirmation" do
        @user.password_confirmation = ''
        expect(@user).to have(1).error_on(:password_confirmation)
      end
    end

    context "when password_confirmation is nil" do
      it "is valid without password_confirmation" do
        @user.password_confirmation = nil
        expect(@user).to be_valid
      end
    end
  end

  describe "authenticate username and password" do

    describe "self.authenticate" do

      context "when password is correct" do
        it "returns user" do
          user = User.authenticate "nigel@example.com", "123"
          expect(user).to be_valid
          expect(user.class).to eq User
        end
      end

      context "when password is incorrect" do
        it "returns nil" do
          user = User.authenticate "nigel@example.com", "12345678"
          expect(user).to be_nil
        end
      end
    end

    describe "authenticate" do
      it "authenticates correctly" do
        user = User.find_by email: "nigel@example.com"
        auth_result = user.authenticate "123"
        result = user.fish == BCrypt::Engine.hash_secret("123", user.salt)
        expect(auth_result).to eq result
      end
    end
  end

end
