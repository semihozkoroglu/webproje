class CreateKuls < ActiveRecord::Migration
  def change
    create_table :kuls do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
