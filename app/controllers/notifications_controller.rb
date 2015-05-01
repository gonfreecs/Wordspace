class NotificationsController < ApplicationController
def notify
@commentnotifier = current_user.notifer
end
end
