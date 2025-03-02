class Sale < ApplicationRecord
  belongs_to :customer
  belongs_to :old_car

  # Validations
  validates :sale_date, presence: true
  validates :sale_price, numericality: { greater_than_or_equal_to: 0 }
end
