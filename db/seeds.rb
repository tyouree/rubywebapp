# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  user_id = "admin#{n+1}"
  user_name = "admin#{n+1}"
  password = "admin"
  user_level = n + 1
  if user_level > 3
    user_level = 3
  end

  updated_id = "system"
  UserMaster.create!(user_id:  user_id,
                     user_name: user_name,
                     password: password,
                     password_confirmation: password,
                     user_level: user_level,
                     updated_id: updated_id)
end
