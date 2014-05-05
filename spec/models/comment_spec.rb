require 'spec_helper'

describe Comment do

  before :each do
    @comment = Comment.new(content:"some content")
  end

  describe "validation" do
    context "content" do
      it "is valid with content" do
        expect(@comment.presence).to be_true
      end
    end
  end
end
