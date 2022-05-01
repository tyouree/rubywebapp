module LoginHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.user_id
    session[:user_name] = user.user_name
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= UserMaster.find_by(user_id: session[:user_id])
  end

  # Returns true if the riyousha is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Returns true if the given riyousha is the current riyousha.
  def current_user?(user)
    user == current_user
  end

  # log out
  def log_out
    session.delete(:user_id)
    session.delete(:user_name)
    @current_user = nil
  end

  # Redirects to stored location (or to the default).
  #def redirect_back_or(default)
  #  redirect_to(session[:forwarding_url] || default)
  #  session.delete(:forwarding_url)
  #end

  # Stores the URL trying to be accessed.
  #def store_location
  #  session[:forwarding_url] = request.original_url if request.get?
  #end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      #store_location
      render_401
    end
  end

  # check whether is super user
  #def is_super_user?
  #  if logged_in? and @current_user.user_level == 1
  #    return true
  #  else
  #    return false
  #  end
  #end

  # check whether is admin user
  #def is_admin_user?
  #  if logged_in? and @current_user.user_level == 2
  #    return true
  #  else
  #    return false
  #  end
  #end

  # check whether user is admin or super
  def super_or_admin_user
    render_404 unless current_user.user_level != 3
  end

  def super_user
    render_404 if current_user.user_level != 1
  end

  def is_common_user?
     current_user.user_level == 3
  end
end
