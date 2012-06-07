class AdminsController < ApplicationController
	def bilgilerim
		if session[:admin_id]
			@admin = Admin.find(session[:admin_id])
		else
			flash[:error] = 'Giriş Yapınız.'
			return redirect_to '/users/login'
		end
	end
	def sirket_duzenle
    @sirket = Sirket.find(params[:sirket])
	end
	def user_duzenle
    @user = User.find(params[:user])
	end
	def update_sirket
    @sirket = Sirket.find(params[:id])
    if @sirket.update_attributes(:isim => params[:isim], :adres => params[:adres], :telefon => params[:telefon], :email => params[:email])
			flash[:success] = "Güncelleme Başarılı."
      return redirect_to '/admins/anasayfai#2'
    else
			flash[:error] = "Güncelleme Hatalı !"
			return redirect_to '/admins/anasayfa#tab1'
		end
	end

	def update_user
		@user = User.find(params[:id])
		if @user.update_attributes(:number => params[:number], :tc => params[:tc], :isim => params[:isim], :soyisim => params[:soyisim], :email => params[:email], :telefon => params[:telefon], :password => params[:dogumgunu], :unvan => params[:unvan])
			flash[:success] = "Güncelleme Başarılı."
			return redirect_to '/admins/anasayfa'
		else
			flash[:error] = "Güncelleme Hatalı !"
			return redirect_to '/admins/anasayfa#tab1'
		end
	end

  def update_admin
    @admin = Admin.find(params[:id])
		session[:admin_id] = @admin.id
    if params[:value] == "password" and params[:post].length < 6
      flash[:error] = "Şifreniz 6 karakterden küçük olmamalı !"
      return redirect_to :back
    end
    if params[:value] == "email" and not params[:post] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
      flash[:error] = "Email bilgileriniz yanlış, kontrol ediniz."
      return redirect_to :back
    end
    if @admin.update_attributes(params[:value] => params[:post])
			flash[:success] = "Güncelleme Başarılı."
      return redirect_to '/admins/bilgilerim'
		end
	end
  def anasayfa
    @sirket = Sirket.all
    @user = User.all
#    @sirket_sube = @sirket.sube
#    @sirket_urun = @sirket.urun
#    @sirket_harcama = @sirket.harcama
#    @toplam = 0
  end
  def new
    if Sirket.find_by_isim(params[:isim])
      flash[:error] = "Bu şirket sistemde kayıtlı !"
      return redirect_to '/admins/anasayfa#tab1'
    else
      Sirket.ekle(params[:isim],params[:adres],params[:telefon],params[:email],params[:sifre])
      flash[:success] = "Şifreniz mail adresine gönderildi."
      return redirect_to '/admins/anasayfa#tab1'
    end
  end

  def destroy
		begin
			Sube.delete_all("sirket_id = "+ params[:id])
			Sirket.find(params[:id]).destroy
      redirect_to '/admins/anasayfa#tab1'
		rescue
			Harcama.delete_all("card_id = " + Card.find_by_user_id(params[:id]).id).destroy
			Yukleme.delete_all("card_id = " + Card.find_by_user_id(params[:id]).id).destroy
			Card.find_by_user_id(params[:id]).destroy
			User.find(params[:id]).destroy
			redirect_to '/admins/anasayfa#tab2'
    end
  end
	def incele
		@sirket = Sirket.find(params[:sirket])
		@sirket_harcama = @sirket.harcama
		@toplam = 0
	end
end
