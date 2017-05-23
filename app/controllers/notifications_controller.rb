class NotificationsController < ApplicationController
  def show
  	Notification.find(params[:notification_id]).read!
  	redirect_back_or '/'
  end
end
