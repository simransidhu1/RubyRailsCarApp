class OldCar < ApplicationRecord
  belongs_to :company
  has_many :sales
  has_many :customers, through: :sales

  # Validations
  validates :model, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1900 }
  validates :engine_ltr, numericality: { greater_than: 0 }
  validates :price_old, numericality: { greater_than_or_equal_to: 0 }
end
