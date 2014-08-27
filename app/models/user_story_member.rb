class UserStoryMember < ActiveRecord::Base

	belongs_to :user
  	belongs_to :user_story

end
