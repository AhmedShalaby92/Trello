class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable ,:validatable

     before_destroy :delete_owned_projects
	has_many :members, dependent: :destroy
	has_many :projects , through: :members, dependent: :destroy

	private
		def delete_owned_projects
			self.members.each do |member|
				if member.owner == true
					Project.find_by_id(member.project_id).destroy
				end
			end
		end

end
