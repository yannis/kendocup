# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Kendocup::Cup.destroy_all
Kendocup::User.destroy_all

if Kendocup::User.create!(
  email: "admin@kendocup.com",
  password: "adminuser",
  first_name: "Admin",
  last_name: "User",
  admin: true,
  confirmed_at: Time.now
)
p "Admin user created: email: admin@kendocup.com, password: adminuser"
end

if Kendocup::Cup.create!(
  start_on: 2.months.from_now,
  deadline: 1.months.from_now,
  junior_fees_chf: 16,
  junior_fees_eur: 14,
  adult_fees_chf: 30,
  adult_fees_eur: 25
)
p "First cup created"
end
