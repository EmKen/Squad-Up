class Api::V1::ProjectChatsController < Api::V1::ApplicationController
	def create
		ProjectChat.create(project_id:params["project_id"],user_id:current_user.id,message:params["message"])
		chat = Project.find(params["project_id"]).project_chats.last
		render json:chat
	end

	def index
		chats = Project.find(params["project_id"]).project_chats
		render json:chats
	end
end
