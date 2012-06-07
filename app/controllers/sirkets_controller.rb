class SirketsController < ApplicationController
	def bilgilerim
		if session[:sirket_id]
			@sirket = Sirket.find(session[:sirket_id])
		else
			flash[:error] = 'Giriş Yapınız.'
			return redirect_to '/users/login'
		end
	end
	def sube_duzenle
    @sube = Sube.find(params[:sube])
	end
	def urun_duzenle
		@urun = Urun.find(params[:urun])
	end
	def update_sube
    @sube = Sube.find(params[:id])
    if @sube.update_attributes(:isim => params[:post])
			flash[:success] = "Güncelleme Başarılı."
      return redirect_to '/sirkets/anasayfa'
    else
			flash[:error] = "Güncelleme Hatalı !"
			return redirect_to '/sirkets/anasayfa#tab1'
		end
	end

  def update_urun		
		@urun = Urun.find(params[:id])
		session[:sirket_id] = @urun.sirket_id
    if @urun.update_attributes(:isim => params[:isim],:fiyat => params[:fiyat],:adet => params[:adet])
      flash[:success] = "Güncelleme Başarılı."
      return redirect_to '/sirkets/anasayfa#tab2'
    else
      flash[:error] = "Güncelleme Hatalı !"
      return redirect_to '/sirkets/anasayfa#tab2'
    end
  end
  def update_sirket
    @sirket = Sirket.find(params[:id])
		session[:sirket_id] = @sirket.id
    if params[:value] == "sifre" and params[:post].length < 6
      flash[:error] = "Şifreniz 6 karakterden küçük olmamalı !"
      return redirect_to :back
    end
    if params[:value] == "email" and not params[:post] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
      flash[:error] = "Email bilgileriniz yanlış, kontrol ediniz."
      return redirect_to :back
    end
    if @sirket.update_attributes(params[:value] => params[:post])
			flash[:success] = "Güncelleme Başarılı."
      return redirect_to '/sirkets/bilgilerim'
	  else
			flash[:error] = "Güncelleme Hatalı !"
			return redirect_to '/sirkets/bilgilerim'
		end
  end
 	def anasayfa
		@sirket = Sirket.find(session[:sirket_id])
		@sirket_sube = @sirket.sube
		@sirket_urun = @sirket.urun
		@sirket_harcama = @sirket.harcama
		@toplam = 0
	end
	def new
		if Sube.find_by_isim_and_sirket_id(params[:isim],session[:sirket_id])
			flash[:error] = "Bu şube sistemde kayıtlı !"
			return redirect_to '/sirkets/anasayfa#tab3'
		else
			Sube.ekle(params[:isim],session[:sirket_id])
			flash[:success] = "Kayıt Eklendi."
			return redirect_to '/sirkets/anasayfa#tab1'
		end
	end
	def yeni_urun
    if Urun.find_by_isim(params[:isim])
      flash[:error] = "Bu ürün sistemde kayıtlı !"
      return redirect_to '/sirkets/anasayfa#tab4'
    else
			Urun.ekle(params[:isim],params[:fiyat],params[:adet],session[:sirket_id])
      flash[:success] = "Kayıt eklendi."
      return redirect_to '/sirkets/anasayfa#tab2'
    end
	end
	def incele
		@sube = Sube.find(params[:sube])
		@sube_harcama = @sube.harcama
		@toplam = 0
	end
  def destroy
    if Sube.find(params[:id]).destroy
      redirect_to '/sirkets/anasayfa#tab1'
    end
  end
end



