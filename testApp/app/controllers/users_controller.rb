class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  def index
    @users = User.all
	@users = User.paginate page: params[:page], 
      per_page: 5
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

def admins_welcome

end

  # GET /users/1
  # GET /users/1.json
  def show
   @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end

  end

  # GET /users/new
  # GET /users/new.json
  def new

	@member = current_member
	@user = User.new
	@user.email = current_member.email

#render text: @user.email
	
=begin
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
      tag_ids = params[:tag_ids]
  end
=end
  
  end



  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    




    arr= params[:hobbies]
    hob=""
    if !(params[:hobbies]==nil)
          arr.each do |a|
    
            if(hob == "")
               hob=a
             else
               hob =hob +","+ a
            end
    end
    
    else
     @user.hobbies="none"
   
   end
    @user.hobbies=hob
    @user.gender=params[:gender]
     @user.project_name="none"                      # for not nil project value
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])




    arr= params[:hobbies]
    hob=""
    if !(params[:hobbies]==nil)
          arr.each do |a|
    
            if(hob == "")
               hob=a
             else
               hob =hob +","+ a
            end
    end
    
    else
     @user.hobbies="none"
   
   end
    @user.hobbies=hob
    @user.gender=params[:gender]
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
