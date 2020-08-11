class Public::NotificationsController < ApplicationController
  before_action :authenticate_public_customer!, only: [:index, :hide]
  def index
    @notifications = current_public_customer.passive_notifications.where(checked: false)
  end

  def hide
    @notifications = current_public_customer.passive_notifications.where(checked: false)
    @notifications.each do |notification|
      notification.update_attributes(checked: true)
    end
    redirect_back(fallback_location: public_root_path)
  end
end
