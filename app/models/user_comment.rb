class UserComment < ActiveRecord::Base
	belongs_to :user_story
	belongs_to :user
end
