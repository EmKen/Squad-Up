class Api::V1::ProjectChatsController < Api::V1::ApplicationController
	def create
		chat = ProjectChat.new(project_id:params["project_id"].to_i,user_id:current_user.id,message:params["message"])
		if chat.save
      ActionCable.server.broadcast 'messages',
        chat
      head :ok
		else
			render json:chat.errors.messages
		end
	end

	def index
		chats = Project.find(params["project_id"].to_i).project_chats
		render json:chats
	end
end
