class UserNotifier < ActionMailer::Base

  LINK_TO_RESET = "[Sk8] Reset your credentials"
  WAS_RESET     = "[Sk8] Your password has been reset!"

  default from: "Sk8 <webmaster@Sk8.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: LINK_TO_RESET
  end


  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: WAS_RESET
  end


end