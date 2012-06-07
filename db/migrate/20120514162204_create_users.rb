class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :number
			t.string :tc
			t.string :isim
			t.string :soyisim
			t.string :email
			t.string :telefon
			t.string :password	
			t.date :dogumgunu
			t.string :unvan
			t.integer :gecici

    end
  end
end
