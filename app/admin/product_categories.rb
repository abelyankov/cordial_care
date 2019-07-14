ActiveAdmin.register ProductCategory do
  permit_params :name, :ancestry
  sortable tree: true,
           max_levels: 0,               # infinite indent levels
           protect_root: false,         # allow root items to be dragged
           sorting_attribute: :name,
           parent_method: :parent,
           children_method: :children,
           roots_method: :roots,
           roots_collection: nil,       # proc to specifiy retrieval of roots
           sortable: true,              # Disable sorting (use only 'tree' functionality)
           collapsible: false,          # show +/- buttons to collapse children
           start_collapsed: false

  index :as => :sortable do
    label :name
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :ancestry,
              as: :select2,
              collection: ProductCategory.order(:names_depth_cache).map { |c| ["-" * c.depth + c.name,c.id] }
    end
    f.actions
  end
end