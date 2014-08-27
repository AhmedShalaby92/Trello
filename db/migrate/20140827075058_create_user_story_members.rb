class CreateUserStoryMembers < ActiveRecord::Migration
  def change
    create_table :user_story_members do |t|
    	t.string :user_id
    	t.text :user_story_id
    end
  end
end
