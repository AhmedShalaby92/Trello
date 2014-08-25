class ChangeStateTypeinUserStories < ActiveRecord::Migration
  def change
  	change_column :user_stories, :state, :integer, :default => 0
  end
end
