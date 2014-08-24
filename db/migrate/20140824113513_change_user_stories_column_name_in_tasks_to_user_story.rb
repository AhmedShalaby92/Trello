class ChangeUserStoriesColumnNameInTasksToUserStory < ActiveRecord::Migration
  def change
  	rename_column :tasks, :user_stories_id, :user_story_id
  end
end
