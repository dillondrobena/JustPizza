module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user and user.authenticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
  end

  def logged_in?
    not current_user.nil?
  end

  def is_admin?
    current_user.admin
  end

  def logout
    forget(@current_user)
    session.delete :user_id
    @current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def check_admin
    unless is_admin?
      store_location
      flash[:danger] = "Only admins can do this!"
      redirect_to login_path
    end
  end

  def logged_in_user?
    unless logged_in?
      store_location
      flash[:danger] = "Login in order to continue"
      redirect_to login_path
    end
  end

  def correct_user?
    @user = User.find(params[:id])
    redirect_to root_path unless current_user? @user
  end
end
