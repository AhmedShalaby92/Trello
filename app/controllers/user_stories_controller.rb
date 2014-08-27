class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [ :show,:edit, :update, :destroy]

  # GET /user_stories
  # GET /user_stories.json
  def index
    @user_stories = UserStory.all
  end

  # GET /user_stories/1
  # GET /user_stories/1.json
  def show
    @project_id=@user_story.project_id.to_s
    @member = current_user.members.where(project_id: @project_id).last
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
    @user_story.project_id = params[:project_id]
    @users=User.all
    @story_member=@user_story.user_story_members.build
  end

  # GET /user_stories/1/edit
  def edit
    @user_ids=UserStoryMember.select(:user_id).where(user_story_id: @user_story.id)
    @users=User.where("id NOT IN (?)" , @user_ids)
    @story_member=@user_story.user_story_members.build
  end

  # POST /user_stories
  # POST /user_stories.json
  def create
    @user_story = UserStory.new(user_story_params)
    params[:user][:id].each do |user|
      if !user.empty?
        @user_story.user_story_members.build(:user_id => user)
      end
    end
    @current_project = Project.find_by_id(params[:user_story][:project_id])
    @current_project.user_stories << @user_story
    respond_to do |format|
      if @user_story.save
        format.html { redirect_to @current_project, notice: 'User story was successfully created.' }
        format.json { render :show, status: :created, location: @user_story }
      else
        format.html { render :new }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_stories/1
  # PATCH/PUT /user_stories/1.json
  def update
    respond_to do |format|
      if @user_story.update(user_story_params)
        puts params.require(:user_story)[:state]
        @user_story.state = params.require(:user_story)[:state]
        format.html { redirect_to @user_story, notice: 'User story was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_stories/1
  # DELETE /user_stories/1.json
  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: 'User story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story = UserStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_params
      # puts "======================================================="
      # puts params
      # puts "======================================================="

      params.require(:user_story).permit(:name, :descp, :state, :project_id)
    end
end
