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


