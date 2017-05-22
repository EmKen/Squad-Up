module UsersHelper
	def profile_picture_helper
		if current_user == @user
			image_tag(@user.profile_picture.file.nil? ? "admin.png" : @user.profile_picture.url, class:"img-circle my-img center-block", alt:"#{@user.profile_picture.file.nil? ? "Default profile picture" : "Profile picture"}", title:"#{@user.profile_picture.file.nil? ? "Default profile picture" : "Profile picture"}")

		else 
			image_tag(@user.profile_picture.file.nil? ? "admin.png" : @user.profile_picture.url, class:"img-circle my-img center-block", alt:"#{@user.profile_picture.file.nil? ? "Default profile picture" : "Profile picture"}", title:"#{@user.profile_picture.file.nil? ? "Default profile picture" : "Profile picture"}")
		end
	end
end
