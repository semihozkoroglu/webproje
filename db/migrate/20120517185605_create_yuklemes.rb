class CreateYuklemes < ActiveRecord::Migration
  def change
    create_table :yuklemes do |t|
			t.integer :card_id
			t.float :miktar
			t.string :yer

      t.timestamps
    end
  end
end
