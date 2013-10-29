class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json

  def index
    @projects = Project.order(:name)
   @projects = Project.paginate page: params[:page],
      per_page: 6
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
                flag = 0
		@user = User.all
		@user.each do |user|
		    if (user.id == @project.user_id)
			flag = 1
			break
		    end
	 	end

if flag==1
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
else
        redirect_to new_project_path, notice: 'Emp-Id not available. Refer view all employees'
        
end

  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
     @project = Project.find(params[:id])
 				
      @user=(User.where(id: params[:project][:user_id]))[0]

      pro_name=@user.project_name				
      #pro_id=@user.project_id
      #render text: pro_name

    respond_to do |format|
      t=1
      if @project.update_attributes(params[:project])
         if(@user.project_name=="none")				
	
 
        @user.update_attribute(:project_name,@project.name)
	@user.update_attribute(:project_id,@project.id)

         else
	arr=Array.new
	arr=pro_name.split(", ")

	arr.each do |i|
                 if(i == @project.name)
			@user.update_attribute(:project_name,pro_name)
			@user.update_attribute(:project_id,pro_id)
			t=0
			break
                          
	         end
	  end #end of aaray
         if t==1		

			    @user.update_attribute(:project_name,pro_name + ", " + @project.name)
         end		
        end
	

       format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }

      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    
    end

	
	#render text: @user.id

#changes done here... repeated code removed

end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  
end
