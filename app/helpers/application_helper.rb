module ApplicationHelper
	def unread_notification_ordered_list
		current_user.notifications.where(read_status:0).order('created_at DESC')
	end

	def read_notification_ordered_list
		current_user.notifications.where(read_status:1).order('created_at DESC')
	end
end
