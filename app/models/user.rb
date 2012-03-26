class User < ActiveRecord::Base
	validates_presence_of :isim, :password

  def self.authenticate(isim, password)
    find_by_isim(isim).try(:authenticate, password)
  end
end
