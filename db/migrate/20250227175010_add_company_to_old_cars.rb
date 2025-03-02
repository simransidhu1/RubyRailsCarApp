class AddCompanyToOldCars < ActiveRecord::Migration[8.0]
  def change
    add_column :old_cars, :company, :text
  end
end
