class UserStoryFile < ActiveRecord::Base
	has_attached_file :document, :default_url => "/files/missing.png"
  	validates_attachment_content_type :document, :content_type => 'text/plain'
  	belongs_to :user_story
end
