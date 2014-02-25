class PasswordResetsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user
     reset_token = SecureRandom.urlsafe_base64(16)

      @user.reset_token = reset_token
      @user.save!

      msg = PasswordMailer.password_reset(@user)
      msg.deliver!
    else
      flash.now[:errors] = ["Cannot find user!"]
      render :new
    end
  end

  def show

  end

  def edit
    @user = User.new
  end

  def update
    user = User.find_by_reset_token(params[:reset_token])
    if user
      user.password = params[:password]
      user.reset_token = nil
      user.save!
      login!(user)

      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid reset token!"]
      redirect_to new_password_reset_url
    end
  end

end
