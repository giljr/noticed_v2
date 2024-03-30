class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user

  private

  def set_notifications
    notifications = Noticed::Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = current_user.notifications.unread
    @read = current_user.notifications.read
  end
end
