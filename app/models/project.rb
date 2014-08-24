class Project < ActiveRecord::Base
	has_many :members
	has_many :users , through: :members
	has_many :user_stories
end