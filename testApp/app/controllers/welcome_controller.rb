class WelcomeController < ApplicationController
  def index
	if member_signed_in?
                
		#if current_member.email.eql?("admin@g.com")
		#	redirect_to users_admins_welcome_path
		#elsif
		#if current_member.email.exists?(:user_id => current_user.id)	
               # else
		redirect_to new_user_path
	#3#	end
	else
		render 'index'
	end
  end
end
