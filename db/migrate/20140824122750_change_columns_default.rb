class ChangeColumnsDefault < ActiveRecord::Migration
  def change
  	change_column :user_stories, :state, :string, :default => 'To Do'
  	change_column :tasks, :state, :boolean, :default => false
  end
end
