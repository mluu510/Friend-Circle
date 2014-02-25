module SessionsHelper

  def current_user
    User.find_by_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    # Set our cookie session token
    session[:token] = user.token
  end

  def logout!
    current_user.reset_session_token
    session[:token] = nil
  end

end
