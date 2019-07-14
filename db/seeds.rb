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

if ProductCategory.all.count == 0
  category_1 = ProductCategory.create(name: "Beauty care")
  category_1_1 = ProductCategory.create(name: "Health care")
  category__2_1 = ProductCategory.create(name: "Cosmetic", parent: category_1)
  category__2_2 = ProductCategory.create(name: "Device", parent: category_1)
  category__2_3 = ProductCategory.create(name: "Supplement", parent: category_1_1)
  category__3_1 = ProductCategory.create(name: "Skin care", parent: category__2_1)
  category__3_2 = ProductCategory.create(name: "Make up", parent: category__2_1)
  category__3_3 = ProductCategory.create(name: "Hair", parent: category__2_1)
  category__3_4 = ProductCategory.create(name: "Face", parent: category__2_2)
  category__3_5 = ProductCategory.create(name: "Vitamin", parent: category__2_3)
  category__3_6 = ProductCategory.create(name: "Blood circulation", parent: category__2_3)
  category__3_7 = ProductCategory.create(name: "Mineral", parent: category__2_3)
  category__3_8 = ProductCategory.create(name: "Protein", parent: category__2_3)
  category__3_9 = ProductCategory.create(name: "Ginseng", parent: category__2_3)
  category__3_10 = ProductCategory.create(name: "Kid", parent: category__2_3)
  category_4 = ProductCategory.create(name: "Toner", parent: category__3_1)
  category_4_1 = ProductCategory.create(name: "Cream", parent: category__3_1)
  category_4_2 = ProductCategory.create(name: "Wrinkle care", parent: category__3_1)
  category_4_3 = ProductCategory.create(name: "Special care ", parent: category__3_1)
  category_4_4 = ProductCategory.create(name: "Cleansing", parent: category__3_1)
  category_4_5 = ProductCategory.create(name: "Essense", parent: category__3_1)
  category_4_6 = ProductCategory.create(name: "Emulsion", parent: category__3_1)
  category_4_7 = ProductCategory.create(name: "Moisture", parent: category__3_1)
  category_4_8 = ProductCategory.create(name: "Sunblock", parent: category__3_1)
  category_4_9 = ProductCategory.create(name: "Mask", parent: category__3_1)
  category_4_10 = ProductCategory.create(name: "Lip", parent: category__3_1)
  category_4_11 = ProductCategory.create(name: "Cushion", parent: category__3_2)
  category_4_12 = ProductCategory.create(name: "Lip", parent: category__3_2)
  category_4_13 = ProductCategory.create(name: "Eye", parent: category__3_2)
  category_4_14 = ProductCategory.create(name: "Foundation", parent: category__3_2)
  category_4_15 = ProductCategory.create(name: "Nail", parent: category__3_2)
  category_4_16 = ProductCategory.create(name: "Hair care", parent: category__3_3)
  category_4_17 = ProductCategory.create(name: "Led mask", parent: category__3_4)
  category_4_18 = ProductCategory.create(name: "ETC", parent: category__3_4)
  category_4_19 = ProductCategory.create(name: "Multi vitamin", parent: category__3_5)
  category_4_20 = ProductCategory.create(name: "Vitamin A", parent: category__3_5)
  category_4_21 = ProductCategory.create(name: "Vitamin B", parent: category__3_5)
  category_4_22 = ProductCategory.create(name: "Vitamin C", parent: category__3_5)
  category_4_23 = ProductCategory.create(name: "Vitamin D", parent: category__3_5)
  category_4_24 = ProductCategory.create(name: "Omega 3", parent: category__3_6)
  category_4_25 = ProductCategory.create(name: "A", parent: category__3_6)
  category_4_26 = ProductCategory.create(name: "B", parent: category__3_6)
  category_4_27 = ProductCategory.create(name: "A", parent: category__3_7)
  category_4_28 = ProductCategory.create(name: "B", parent: category__3_7)
  category_4_29 = ProductCategory.create(name: "A", parent: category__3_8)
  category_4_30 = ProductCategory.create(name: "B", parent: category__3_8)
  category_4_31 = ProductCategory.create(name: "A", parent: category__3_9)
  category_4_32 = ProductCategory.create(name: "B", parent: category__3_9)
  category_4_33 = ProductCategory.create(name: "A", parent: category__3_10)
  category_4_33 = ProductCategory.create(name: "A", parent: category__3_10)
end

SaleType.find_or_create_by(name: "Self purchasing")
SaleType.find_or_create_by(name: "Membership new")
SaleType.find_or_create_by(name: "Membership old")
SaleType.find_or_create_by(name: "Resell")