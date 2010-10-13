
class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :current_user
  helper_method :current_user?


private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def current_user?
    current_user ? true : nil
  end

  def require_user
    unless current_user
      redirect_to back_or_default('/'), :notice => t('user.flashes.mast_logged in')
      return false
    end
  end

  def require_no_user
    if current_user
      redirect_to back_or_default('/'), :notice => t('user.flashes.mast_logged_out')
      return false
    end
  end

  def store_location
    #logger.debug request
    session[:return_to] = request.request_uri if request.request_uri
    session[:return_to] = nil
  end

  def back_or_default(default)
    if session[:return_to].nil?
      url = default
    else
      url = session[:return_to]
    end
    session[:return_to] = nil
    return url
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  #TODO: make a table settings for events like this
  def has_admin
    return(true) if Rails.env == "test" # skip if test
    if User.has_not_admin?
       flash[:error] = t("user.flashes.mast_have_admin")
       redirect_to register_path
    end
  end

  def bread_crumb(title, options = {})
    @bread_crumbs ||= []
    @bread_crumbs << [title, options]
  end

  def bread_crumb_replace_last(*args)
    @bread_crumbs.pop
    bread_crumb(*args)
  end

  #generate tatles for controllers
  def view_title(pref, action_name="")
    action_name = params[:action]  if action_name.empty?
    @view_title = t("#{pref}.#{action_name}")  
  end
end
