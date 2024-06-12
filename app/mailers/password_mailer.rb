class PasswordMailer < ApplicationMailer
  def password_reset
    @user = params[:user]
    @token = params[:token]
    mail(to: @user.email, subject: 'Reset Your Password')
  end
end
