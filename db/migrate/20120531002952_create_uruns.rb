class CreateUruns < ActiveRecord::Migration
  def change
    create_table :uruns do |t|
			t.string :isim
			t.float :fiyat
			t.integer :adet
			t.integer :sirket_id

    end
  end
end
