class PasswordMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset(user)
    @user = user
    @url = password_reset_url

    mail(to: user.email, subject: 'Your new password')
  end
end
