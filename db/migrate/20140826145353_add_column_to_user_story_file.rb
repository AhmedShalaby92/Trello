class AddColumnToUserStoryFile < ActiveRecord::Migration
  def change
  	add_column :user_story_files, :user_story_id, :integer
  end
end
