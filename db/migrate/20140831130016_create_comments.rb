class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      	t.text :content
     	t.integer :user_id
      	t.integer :user_stories_id
    end
  end
end
