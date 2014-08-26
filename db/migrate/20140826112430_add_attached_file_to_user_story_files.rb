class AddAttachedFileToUserStoryFiles < ActiveRecord::Migration
    def self.up
    add_attachment :user_story_files, :document
  end

  def self.down
    remove_attachment :user_story_files, :document
  end

end
