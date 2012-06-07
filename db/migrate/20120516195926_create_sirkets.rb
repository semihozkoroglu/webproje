class CreateSirkets < ActiveRecord::Migration
  def change
    create_table :sirkets do |t|
			t.string :isim
			t.string :adres
			t.string :telefon
			t.string :email
			t.string :sifre

    end
  end
end
