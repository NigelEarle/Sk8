class SessionController < ApplicationController
  # protect_from_forgery with: :null_session

  # skip_before_action :verify_authenticity_token

  def new
    redirect_to spots_url if current_user
  end

  def create
    if params[:user][:password].blank?
      #password reset flow
      PasswordResetter.new(flash).handle_reset_request(user_params)
      # render text: "password reset", status: :unprocessable_entity

    else
      #authenticate password flow
      # return if log_user_in( UserAuthenticator.new(session,flash).authenticate_user(user_params) )
      if user = User.authenticate(params[:user][:email], params[:user][:password])
        # successful login
        redirect_to spots_url
      else
        # fail
        render text: "Sorry! Try again"
      end
    end
    # (redirect_to root_url and return) if flash.empty?
    # render :new

  end

  def destroy
    log_user_out
    # redirect_to login_url, notice: "You've successfully logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end