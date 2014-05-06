class RegistrationController < ApplicationController

  def new

  end

  def create
    @user = User.new( user_params )
    if @user.save
      log_user_in( @user )


    else
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end


end