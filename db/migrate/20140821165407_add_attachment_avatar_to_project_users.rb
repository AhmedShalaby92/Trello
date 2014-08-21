class AddAttachmentAvatarToProjectUsers < ActiveRecord::Migration
  def self.up
    change_table :project_users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :project_users, :avatar
  end
end
