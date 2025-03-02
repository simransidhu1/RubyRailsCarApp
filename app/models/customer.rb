class Customer < ApplicationRecord
    has_many :sales
    has_many :old_cars, through: :sales
  
    validates :name, presence: true
    validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
    validates :salary, numericality: true, allow_nil: true
    validates :gender, inclusion: { in: %w(Male Female Other) }, allow_nil: true
  end
