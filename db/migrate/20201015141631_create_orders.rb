class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string    :postal_code
      t.integer   :prefecture_id
      t.string    :city
      t.string    :addresses
      t.string    :building
      t.string    :phone_number
      t.references :managemant, foerign_key: true
      t.timestamps
    end
  end
end
