module ApplicationCable
	class Connection < ActionCable::Connection::Base
		identified_by :current_user

		def connect
			self.current_user = current_user
		end

		private
    def current_user
			if remember_token.present?
				@current_user ||= user_from_remember_token(remember_token)
			end

			if @current_user
				@current_user 
			elsif !request.headers['private_token'].nil?
				User.find_by(private_token:request.headers["private_token"])
			# else
			# 	reject_unauthorized_connection
			end
		end

		def remember_token
      cookies[remember_token_cookie]
    end

    def remember_token_cookie
      Clearance.configuration.cookie_name.freeze
    end

    def user_from_remember_token(token)
      Clearance.configuration.user_model.where(remember_token: token).first
    end
	end
end

# can't seem to require/include/whatever shit Clearance modules here. 
# What the F is going on
# So just copied all relevant Clearance methods here to get 'current_user' to work.

# iOS couldn't connect if "reject_unauthorized_connection" is uncommented. 
# Problem of not transmitting request headers properly?  