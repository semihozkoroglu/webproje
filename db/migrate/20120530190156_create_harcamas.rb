class CreateHarcamas < ActiveRecord::Migration
  def change
    create_table :harcamas do |t|
			t.datetime :zaman
			t.integer :adet
			t.integer :card_id
			t.integer :sube_id
			t.integer :urun_id
			t.float :tutar

    end
  end
end
