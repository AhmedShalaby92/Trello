class CreateUserStoryFiles < ActiveRecord::Migration
  def change
    create_table :user_story_files do |t|

      t.timestamps
    end
  end
end
