# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(username: 'cordial_care_admin',
              password: 'password',
              password_confirmation: 'password') if Admin.find_by(username: 'cordial_care_admin').nil?

name_of_members_role = ["Beauty Consultant",
                        "Beauty Consultant Leader",
                        "Team manager",
                        "Junior Director",
                        "Senior Director"]

name_of_members_role.each do |member_role|
  MemberRole.find_or_create_by(name: member_role)
end