class ApiProjectChatsChannel < ApplicationCable::Channel  
	def subscribed
  	stream_from "messages_#{params["project_id"]}"
  end
end  