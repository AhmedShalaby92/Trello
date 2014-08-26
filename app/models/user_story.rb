class UserStory < ActiveRecord::Base
	belongs_to :project
	has_many :tasks
	has_many :user_story_files
	accepts_nested_attributes_for :tasks
	enum state: [:to_be_do, :doing, :done]
end
