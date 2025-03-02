class AddDetailsToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :address, :text
    add_column :customers, :gender, :text
    add_column :customers, :age, :integer
    add_column :customers, :salary, :decimal
  end
end
