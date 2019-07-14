ActiveAdmin.register Sale do
  permit_params :sale_type_id, :sale_date,
                :seller_id, :buyer_id,
                :group_id, :team_id,
                :product_id, :quantity,
                :commission_normal, :brand_id

  index do
    selectable_column
    id_column
    column :type
    column :sale_date
    column :seller
    column :buyer
    column :group
    column :team
    column :brand
    column :product
    column :quantity
    column :amount
    column :commission_normal
  end

  form do |f|
    f.inputs do
      f.input :type, as: :select2, collection: SaleType.all.map {|s| [s.name, s.id]}
      f.input :sale_date
      f.input :seller, as: :select2, collection: Member.all.map{|m| [m.member_full_name, m.id]}
      f.input :buyer, as: :select2, collection: Member.all.map{|m| [m.member_full_name, m.id]}
      f.input :group, as: :select2, collection: Group.all.map{|g| [g.name, g.id]}
      f.input :team, as: :select2, collection: Team.all.map{|t| [t.name, t.id]}
      f.input :product, as: :select2, collection: Product.all.map{|p| ["#{p.code}-#{p.name_eng}", p.id]}
      f.input :brand, as: :select2, collection: Brand.all.map{|b| [b.name, b.id]}
      f.input :quantity
      f.input :commission_normal
    end
    f.actions
  end
end