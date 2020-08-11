module Public::NotificationsHelper
  # 未確認通知アイコン表示
  def unchecked_notifications
    @notifications = current_public_customer.passive_notifications.where(checked: false)
    end
end
