class Sube < ActiveRecord::Base
	belongs_to :sirket
	has_many :harcama
	def self.ekle(isim,sirket_id)
		return create(:isim => isim, :sirket_id => sirket_id)
	end
end
