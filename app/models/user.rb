class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable ,:validatable


  before_destroy :delete_owned_projects



  has_many :members, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :projects , through: :members

  def self.search(search)
    if search
      where('username LIKE ?', "%#{search}%")
    
    end
  end


  has_many :user_story_members 
  has_many :user_stories , through: :user_story_members, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  private
  def delete_owned_projects
  	self.members.each do |member|
  		if member.owner == true
  			Project.find_by_id(member.project_id).destroy
  		end
  	end
  end

end
