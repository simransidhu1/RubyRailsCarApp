class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.references :old_car, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.decimal :sale_price
      t.date :sale_date

      t.timestamps
    end
  end
end
