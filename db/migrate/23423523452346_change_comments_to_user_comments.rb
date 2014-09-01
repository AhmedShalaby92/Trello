class ChangeCommentsToUserComments < ActiveRecord::Migration
  def change
  	rename_table :comments, :user_comments
  end
end
