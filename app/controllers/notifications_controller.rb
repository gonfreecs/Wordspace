#
class NotificationsController < ApplicationController
  def notify
    @commentnotifier = current_user.notifer
  end

  # Author: Mayar
  # Date: 1.5.2015
  # Clearing notification
  def clear
    current_user.notifier = 0
    current_user.save
  end
end
