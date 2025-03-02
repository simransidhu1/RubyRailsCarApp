class CreateOldCars < ActiveRecord::Migration[8.0]
  def change
    create_table :old_cars do |t|
      t.references :company, null: false, foreign_key: true
      t.string :model
      t.integer :year
      t.decimal :engine_ltr
      t.decimal :horsepower
      t.decimal :torque_lb
      t.decimal :time_60
      t.decimal :price_old

      t.timestamps
    end
  end
end
