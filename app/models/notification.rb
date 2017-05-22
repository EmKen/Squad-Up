class Notification < ApplicationRecord
	enum read_status: { not_read: 0, read: 1 }
end
