
class SesController < Devise::SessionsController

  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
   if sign_in(resource_name, resource)
		if member_signed_in?
		if current_member.email.eql?("admin@g.com")
		respond_with resource, :location => users_admins_welcome_path
			#redirect_to users_admins_welcome_path
		else
#			render 'index'
		#redirect_to users_path
		
	#render text: params[:email].inspect
		#render text: current_member.email
	          @user = User.where(email: current_member.email)[0]
		#render text: @user.id
		respond_with resource, :location => user_path(@user)


                end
end
	
	
   elsif sign_up(resource_name, resource)
	respond_with resource, :location => welcome_index_path
   end

end

# DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end
end
