Admin.create!(username: 'cordialcare_admin',
              password: 'password',
              password_confirmation: 'password') if Admin.find_by(username: 'cordial_care_admin').nil?

user = User.create!(username: 'abelyankov',
             password: 'cordial123',
             password_confirmation: 'cordial123',
             first_name: 'Arthur',
             last_name: 'Belyankov',
             email: 'abelyankov@cd.kz',
             phone_number: 77083515737,
             address: 'Zheltoksan, 137',
             marital_status: 'Free',
             gender: 'Male'
             )

user_1 = User.create!(username: 'test_name',
                    password: 'cordial123',
                    password_confirmation: 'cordial123',
                    first_name: 'Test',
                    last_name: 'Name',
                    email: 'test@cd.kz',
                    phone_number: 77083515738,
                    address: 'Nurly-Tau, 5k2a',
                    marital_status: 'Free',
                    gender: 'Female'
)



name_of_members_role = ["Beauty Consultant",
                        "Beauty Consultant Leader",
                        "Team manager",
                        "Junior Director",
                        "Senior Director"]

name_of_members_role.each do |member_role|
  MemberRole.find_or_create_by(name: member_role)
end
kz = Location.find_or_create_by(city: "Almaty", country:"Kazakhstan")
t1 = Team.find_or_create_by(name: "Almaty #1", location: kz)
Member.create(user: user, role: MemberRole.find_by(name: "Beauty Consultant Leader"), team: t1)
Member.create(user: user_1, role: MemberRole.find_by(name: "Team manager"), team: t1)

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

Location.find_or_create_by(country: "Казахстан", city: "Алматы")
Location.find_or_create_by(country: "Казахстан", city: "Астана")


es = Brand.find_or_create_by(name: "ESROOM")
well = Brand.find_or_create_by(name: "WELL NATURE")

Product.find_or_create_by(name_eng: "Recovery All in One Solution",
                          membership_price_kzt: 20000,
                          brand_id: es.id,
                          product_category_id: category__3_1.id,
                          unit_price: 30000,
                          unit_type: '200ml',
                          basic_commission: 25,
                          total_commission: 50)

Product.find_or_create_by(name_eng: "Recovery Memory Cream",
                          membership_price_kzt: 25000,
                          brand_id: es.id,
                          unit_price: 40000,
                          unit_type: '50ml',
                          basic_commission: 25,
                          total_commission: 53)

Product.find_or_create_by(name_eng: "Moisture Speed Mist Toner",
                          brand_id: well.id,
                          unit_price: 10000,
                          membership_price_kzt: 8000,
                          unit_type: '155ml',
                          basic_commission: 20,
                          total_commission: 36)