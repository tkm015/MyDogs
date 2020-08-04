class Public::NotificationsController < ApplicationController
  def index
  	#@notifications = current_public_customer.passive_notifications.page(params[:page]).per(20)
  	@notifications = Notification.where(checked: false)
    #@notifications.each do |notification|
    #  notification.update_attributes(checked: true)
    #end
  end
end
