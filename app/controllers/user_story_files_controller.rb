class UserStoryFilesController < ApplicationController
  before_action :set_user_story_file, only: [:show, :edit, :update, :destroy]

  # GET /user_story_files
  # GET /user_story_files.json
  def index
    @user_story_files = UserStoryFile.all
  end

  # GET /user_story_files/1
  # GET /user_story_files/1.json
  def show
    
  end

  # GET /user_story_files/new
  def new
    @user_story = UserStory.find params[:user_story_id]
    @user_story_file = @user_story.user_story_files.new
  end

  # GET /user_story_files/1/edit
  def edit
  end

  # POST /user_story_files
  # POST /user_story_files.json
  def create
    @user_story = UserStory.find params[:user_story_id]; 
    @user_story_file = @user_story.user_story_files.build(user_story_file_params)
    # UserStoryFile.new(user_story_file_params) 

    respond_to do |format|
      if @user_story_file.save
        format.html { redirect_to user_story_path(@user_story), notice: 'User story file was successfully created.' }
        format.json { render :show, status: :created, location: @user_story_file }
      else
        format.html { render :new }
        format.json { render json: @user_story_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_story_files/1
  # PATCH/PUT /user_story_files/1.json
  def update
    respond_to do |format|
      if @user_story_file.update(user_story_file_params)
        format.html { redirect_to @user_story_file, notice: 'User story file was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story_file }
      else
        format.html { render :edit }
        format.json { render json: @user_story_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_story_files/1
  # DELETE /user_story_files/1.json
  def destroy
    @user_story_file.destroy
    respond_to do |format|
      format.html { redirect_to user_story_files_url, notice: 'User story file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story_file
      @user_story_file = UserStoryFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_file_params
      params.require(:user_story_file).permit(:document)
    end
end
