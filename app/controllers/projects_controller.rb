class ProjectsController < ApplicationController
	 before_action :set_project, only: [:show, :edit, :update, :destroy]
	 before_action :check , only: [:show, :edit, :update, :destroy]

	def check
		relation=Member.where(user_id: current_user.id,project_id: params[:id])
		
		puts relation
		
		if relation.empty?
			
			redirect_to projects_url, :notice => "There is no such a project"
		end
	end
	def index
		@projects =Project.joins(:members).where(members: {user_id: current_user.id})
	end

	def show
		#TODO fix relation 
		@owner_check = false
		if(@project.user_id==current_user.id)
			@owner_check=true
		end
		@users=User.search(params[:members_search])
		@member=@project.members.build
#		params[:user][:id].each do |user|
#			if !user.empty?
#				@project.members.build(:user_id => user)
#			end
#		end
		@all_members = @project.users
  	end

	def new
		@project=Project.new
		#TODO remove member and make it by ajax
		@users=User.where.not(id: current_user.id)
		@member=@project.members.build
	end

	def edit
		#current_user.projects(id: params[:id])
		@user_ids=Member.select(:user_id).where(project_id: Project.find(params[:id]))
		@users=User.where("id NOT IN (?)" , @user_ids)
		@member=@project.members.build
  	end


	def create
		@project= Project.new(project_params)
		@project[:user_id]=current_user.id
#		params[:user][:id].each do |user|0
#			if !user.empty?
#				@project.members.build(:user_id => user)
#			end
#		end
	    respond_to do |format|
	      if @project.save
	      	@member = Member.new
			@member.user_id=current_user.id
			@member.project_id=@project.id
			@member.owner=1
			@member.save
	        format.html { redirect_to @project, notice: 'Project was successfully created.' }
	        format.json { render :show, status: :created, location: @project }
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end


	def update

		params[:user][:id].each do |user|
			if !user.empty?
				@project.members.build(:user_id => user)
			end
		end
		respond_to do |format|
	      if @project.save
	        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
	        format.json { render :show, status: :created, location: @project }
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destory
		@project.destroy
    	respond_to do |format|
      		format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      		format.json { head :no_content }
    	end
	end
	def add_members
		params[:user][:id].each do |user|
			if !user.empty?
				@project.members.build(:user_id => user)
			end
		end
	end
	private
    # Use callbacks to share common setup or constraints between actions.
	    def set_project
	      @project = Project.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def project_params
	      params.require(:project).permit(:name, :description,:user_id)
	    end

end