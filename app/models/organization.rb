class Organization < ActiveRecord::Base
	has_many :events
	#has_and_belongs_to_many :users
	has_many :organization_users
	has_many :users, :through => :organization_users
	validates_presence_of :name
	validates_uniqueness_of :name, :case_sensitive => false
	
	scope :for_user, lambda {|user| joins(:users).where('user_id = ?', user.id)}
end
