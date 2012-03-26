class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string   "isim"
	    t.string   "soyisim"
	    t.string   "email"
	    t.string   "password"
	    t.integer  "tckimlik"
	    t.string   "telefon"
	    t.date     "dogum_tarihi"
  	  t.string   "unvan"
      t.timestamps
    end
  end
end
