class CreateUserBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :user_buys do |t|
      t.references :user, freign_key: true
      t.references :item, freign_key: true
      t.timestamps
    end
  end
end
