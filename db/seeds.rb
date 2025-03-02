require 'faker'
require 'csv'
# Clear existing records (optional, prevents duplicates)
#Customer.destroy_all
#Company.destroy_all



500.times do
    Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,  # Add email
      phone: Faker::PhoneNumber.phone_number,  # Add phone
      address: Faker::Address.full_address,
      gender: %w[Male Female Other].sample,
      age: rand(18..80),
      salary: rand(30000..150000)
    )
  end
  
  puts "✅ Created #{Customer.count} customers."



csv_file_path = Rails.root.join('db', 'seeds', 'companies.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
  name = row["name"]&.strip || "Unknown"
  country = row["country"]&.strip || "Unknown"

  Company.find_or_create_by(name: name, country: country)
end

puts "Companies table seeded successfully!"



csv_file_path = Rails.root.join('db', 'seeds', 'old_cars.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
  company = Company.find_or_create_by(name: row["company"].strip)

  engine_ltr = row["engine_ltr"].to_f
  next if engine_ltr <= 0  # Skip invalid rows

  OldCar.create!(
    company: company,
    model: row["model"]&.strip,
    year: row["year"]&.to_i,
    engine_ltr: engine_ltr,
    horsepower: row["horsepower"]&.to_f,
    torque_lb: row["torque_lb"]&.to_f,
    time_60: row["time_60"]&.to_f,
    price_old: row["price_old"]&.to_f
  )
end

puts "OldCars table seeded successfully!"



old_cars = OldCar.pluck(:id)
customers = Customer.pluck(:id)

500.times do
  Sale.create!(
    old_car_id: old_cars.sample,
    customer_id: customers.sample,
    sale_price: Faker::Number.decimal(l_digits: 5, r_digits: 2), # Random price
    sale_date: Faker::Date.between(from: '2010-01-01', to: Date.today)
  )
end

puts "✅ Created #{Sale.count} sales records!"


