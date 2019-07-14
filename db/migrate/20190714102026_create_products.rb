class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name_eng
      t.string :name_rus
      t.references :product_category
      t.references :brand
      t.integer :purchasing_price_usd
      t.integer :purchasing_price_kzt
      t.date :price_period
      t.string :freight
      t.integer :import_duty
      t.integer :vat
      t.string :handling_charge
      t.integer :unit_price
      t.integer :commission
      t.timestamps
    end
  end
end
