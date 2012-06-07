class CreateSubes < ActiveRecord::Migration
  def change
    create_table :subes do |t|
			t.string :isim
			t.integer :sirket_id

    end
  end
end
