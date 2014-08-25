class Project < ActiveRecord::Base
	has_many :members
	has_many :users , through: :members
	has_many :user_stories
	accepts_nested_attributes_for :user_stories
end