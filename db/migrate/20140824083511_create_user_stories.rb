class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :descp
      t.string :state

      t.timestamps
    end
  end
end
