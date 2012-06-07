class Urun < ActiveRecord::Base
	has_many :harcama
	belongs_to :urun
  def self.ekle(isim,fiyat,adet,sirket_id)
    return create(:isim => isim,:fiyat => fiyat, :adet => adet, :sirket_id => sirket_id)
  end
	def self.guncelle(id,isim,fiyat,adet)
		return update_attributes(:id => id ,:isim => isim,:fiyat => fiyat, :adet => adet)
	end
end
