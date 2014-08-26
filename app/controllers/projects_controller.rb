class ProjectsController < ApplicationController
	 before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects =Project.joins(:members).where(members: {user_id: current_user.id})
	end

	def show
  	end

	def new
		@project=Project.new
		@users=User.where.not(id: current_user.id)
		@member=@project.members.build
	end

	def edit
  	end


	def create
		@project= Project.new(project_params)
		params[:user][:id].each do |user|
			if !user.empty?
				@project.members.build(:user_id => user)
			end
		end
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
	end

	def destory
	end

	private
    # Use callbacks to share common setup or constraints between actions.
	    def set_project
	      @project = Project.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def project_params
	      params.require(:project).permit(:name, :description)
	    end

end