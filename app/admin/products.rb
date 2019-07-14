ActiveAdmin.register Product do
  permit_params :name_eng, :name_rus, :product_category_id, :brand_id, :purchasing_price_usd,
                :purchasing_price_kzt, :price_period, :freight, :import_duty, :vat,
                :handling_charge, :unit_price, :commission

  index do
    selectable_column
    id_column
    column :name_eng
    column :category
    column :brand
    column :purchasing_price_usd
    column :purchasing_price_kzt
    column :price_period
    column :vat
    column :handling_charge
    column :unit_price
    column :commission
    column :created_at, :sortable => :created_at do |obj|
      obj.created_at.localtime
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name_eng, label: "Product name(english)"
      f.input :name_rus, label: "Product name(russian)"
      f.input :product_category_id, as: :select2, collection: ProductCategory.order(:names_depth_cache).map { |c| ["#{c.names_depth_cache} " + c.name,c.id] }
      f.input :brand_id, as: :select2, collection: Brand.all.map{|b| [b.name, b.id]}
      f.input :purchasing_price_usd, label: "Purchasing price USD"
      f.input :purchasing_price_kzt, label: "Purchasing price KZT"
      f.input :price_period
      f.input :freight
      f.input :import_duty
      f.input :vat
      f.input :handling_charge
      f.input :unit_price
      f.input :commission
    end
    f.actions
  end
end