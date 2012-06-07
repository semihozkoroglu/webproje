class UsersController < ApplicationController
	def bilgilerim
		if session[:user_id]
			@user = User.user(session[:user_id])
		else
			flash[:error] = 'Giriş Yapınız.'
			return redirect_to '/users/login'
		end
	end
	def login
		return redirect_to '/users/index' if session[:user_id]
		return redirect_to '/users/index' if session[:sirket_id]
		return redirect_to '/users/index' if session[:admin_id]

		if @user = User.authentication(params[:number],params[:password])
			session[:user_id] = @user.id
			return redirect_to '/users/hesap' if @user.gecici?
			return redirect_to '/users/index'
		elsif @sirket = Sirket.authentication(params[:number],params[:password])
			session[:sirket_id] = @sirket.id
			return redirect_to '/users/index'
		elsif @admin = Admin.authentication(params[:number],params[:password])
			session[:admin_id] = @admin.id
			return redirect_to '/users/index'
		else params[:number] and params[:password]
			flash[:error] = "Numaranız veya şifreniz hatalı !"
		end
	end
	def sifreguncelle
		@user = User.find(session[:user_id])
		if params[:password].length < 6
			flash[:error] = "Şifreniz en az 6 karakterli olmalıdır !"
      return redirect_to :back
		end
    if params[:number] != params[:password]
      flash[:error] = "Şifreler uyuşmuyor !"
      return redirect_to '/users/hesap'
    else
      @user.update_attributes(:password => params[:password], :gecici => 0)
			flash[:success] = "Şifreniz Kaydedildi."
      return redirect_to '/users/index'
    end
	end
	def hesap
		@user = User.find(session[:user_id])
	end
  def edit
    @user = User.user(session[:user_id])
  end
	def update_card
    @user = User.user(params[:id])
		session[:user_id] = @user.id
    if Card.find_by_user_id(@user.id).update_attributes(params[:value] => params[:post])
			flash[:success] = "Güncelleme Başarılı."
      return redirect_to '/users/anasayfa#tab3'
    else
			flash[:error] = "Güncelleme Hatalı !"
			return redirect_to 'users/anasayfa#tab3'
		end
	end
  def update_user
    @user = User.user(params[:id])
		session[:user_id] = @user.id
		if params[:value] == "password" and params[:post].length < 6
			flash[:error] = "Şifreniz 6 karakterden küçük olmamalı !"
			return redirect_to :back
		end
		if params[:value] == "email" and not params[:post] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
			flash[:error] = "Email bilgileriniz yanlış, kontrol ediniz."
			return redirect_to :back
		end
    if @user.update_attributes(params[:value] => params[:post])
			flash[:success] = "Güncelleme Başarılı."
      return redirect_to '/users/bilgilerim'
    else
			flash[:error] = "Güncelleme Hatalı !"
			return redirect_to 'users/bilgilerim'
		end
  end
  def destroy
    session[:user_id] = nil if session[:user_id]
    session[:sirket_id] = nil if session[:sirket_id]
    session[:admin_id] = nil if session[:admin_id]
    redirect_to root_url
  end
	def anasayfa
		@user = User.user(session[:user_id])
		@user_yukleme = @user.yukleme
		@user_card = @user.card
		@user_harcama = @user.harcama
		@total = 0
	end
	def user_forget
		if @user = User.find_by_email(params[:email])
			@gecici_sifre = rand(9999999)
			@user.update_attributes(:password => @gecici_sifre, :gecici => 1)
			UserMailer.welcome_email(@user,@gecici_sifre).deliver	
			flash[:success] = "Geçici şifreniz email hesabınıza gönderildi."
			 return redirect_to :root
		else
			flash[:error] = "Kullanıcı bulunamadı !"
			return redirect_to '/users/forget'
		end
	end
end
