class Project < ActiveRecord::Base
	has_many :members, dependent: :destroy
	belongs_to :user
	has_many :users , through: :members 
	has_many :user_stories , dependent: :destroy
	accepts_nested_attributes_for :user_stories
end