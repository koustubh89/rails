class RegistrationController < Devise::RegistrationsController

def new

@member= Member.new
@user = User.new
end

def create

@member = Member.new
@member.username = params[:member][:username]
@member.email = params[:member][:email]
@member.password = params[:member][:password]
@member.password_confirmation =params[:member][:password_confirmation]

@user = User.new
@user.email = @member.email
render text: @user.email

@member.valid?
if @member.errors.blank?

@member.save
@user.member = @member
@user.save
redirect_to dashboard_path
else
render :action => "new"
end

end

end
