class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
			t.string :isim
			t.string :soyisim
			t.string :email
			t.string :password

      t.timestamps
    end
  end
end
