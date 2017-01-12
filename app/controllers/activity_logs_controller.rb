class ActivityLogsController < ApplicationController

  before_filter :verify_is_admin
  def index
    @logs = ActivityLog.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)

  end

end