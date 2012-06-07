class Sirket < ActiveRecord::Base
	has_many :sube
	has_many :urun
	has_many :harcama, :through => :sube
	validates :email, :presence => { :message => 'Boş bırakılamaz' }
  def self.authentication(isim,sifre)
    return find_by_isim_and_sifre(isim,sifre)
  end
  def self.ekle(isim, adres, telefon, email, sifre)
    return create(:isim => isim, :adres => adres, :telefon => telefon, :email => email, :sifre => sifre)
  end
end
