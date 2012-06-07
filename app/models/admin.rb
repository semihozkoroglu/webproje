class Admin < ActiveRecord::Base
  def self.authentication(isim,sifre)
    return find_by_isim_and_password(isim,sifre)
  end
end
