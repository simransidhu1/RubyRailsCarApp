class Company < ApplicationRecord
    has_many :old_cars
  
    # Validations
    validates :name, presence: true, uniqueness: true
    validates :country, presence: true
  end
  