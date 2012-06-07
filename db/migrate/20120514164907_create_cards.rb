class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
			t.string :kartid
			t.integer :aktif
			t.integer :user_id
			t.integer :bakiye

    end
  end
end
