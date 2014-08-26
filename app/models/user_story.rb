class UserStory < ActiveRecord::Base
	belongs_to :project
	has_many :user_story_files
	has_many :tasks, dependent: :destroy
	accepts_nested_attributes_for :tasks
	enum state: [:to_be_do, :doing, :done]
end
