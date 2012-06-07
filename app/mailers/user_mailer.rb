class UserMailer < ActionMailer::Base
	default :from => "omukampuskart@gmail.com"
  def welcome_email(user,gecici_sifre)
    @user = user
		@gecici_sifre = gecici_sifre
    mail(:to => user.email,
         :subject => "Şifre Yenileme İsteği")
  end
end
