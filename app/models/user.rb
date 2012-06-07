class User < ActiveRecord::Base
	has_many :card
	has_many :yukleme, :through => :card
	has_many :harcama, :through => :card
	def self.authentication(number,password)
		return find_by_number_and_password(number,password)
	end
	def self.user(id)
		return find(id)
	end
end
