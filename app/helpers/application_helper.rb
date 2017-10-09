module ApplicationHelper

  def require_login
    redirect_to '/' unless logged_in?
  end

  def current_user
    current_user ||= User.find_by(:id => params[:id])
  end

  def logged_in?
    !!current_user
  end

end
