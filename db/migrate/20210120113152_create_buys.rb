class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string :postal_code,  null: false
      t.integer :prefecture_id, null:false
      t.string :municipality, null:false
      t.string :address, null:false
      t.string :building_name
      t.string :phone_number, null:false
      t.references :user_buy, freign_key: true
      t.timestamps
    end
  end
end
