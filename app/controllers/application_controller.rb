class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :verify_logged_in

  before_action :set_locale

  def set_locale
    I18n.locale = "en"
  end

  def current_user
    @current_user ||= User.find_by_id(session["user_id"])
  end

  def is_admin
    current_user.is_admin
  end

  def record_activity(note)
    @activity = ActivityLog.new
    @activity.user_id = current_user.id
    @activity.note = note
    @activity.browser = request.env['HTTP_USER_AGENT']
    @activity.ip_address = request.env['REMOTE_ADDR']
    @activity.controller = controller_name
    @activity.action = action_name
    @activity.params =  params.require(:q).permit(:part_number_cont, :description_cont).inspect
    @activity.save
  end

def verify_logged_in
  unless current_user
    redirect_to login_path
  end
end

  def verify_is_admin
    unless is_admin
      redirect_to root_path
    end
  end

  helper_method :current_user, :is_admin, :verify_is_admin
end
