ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :email, :password,
                :password_confirmation,
                :first_name, :last_name,
                :phone_number, :username,
                :birthday, :address,
                :marital_status, :gender


  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :username
    # column :current_sign_in_at, :sortable => :created_at do |obj|
    #   obj.created_at.localtime
    # end
    # column :sign_in_count, :sortable => :created_at do |obj|
    #   obj.created_at.localtime
    # end
    column :created_at, :sortable => :created_at do |obj|
      obj.created_at.localtime
    end
    actions
  end

  filter :email
  filter :phone_number
  filter :last_name
  filter :first_name
  filter :username
  filter :current_sign_in_at, :sortable => :created_at do |obj|
    obj.created_at.localtime
  end
  filter :sign_in_count, :sortable => :created_at do |obj|
    obj.created_at.localtime
  end
  filter :created_at, :sortable => :created_at do |obj|
    obj.created_at.localtime
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :birthday, start_year: 1950, order: [:day, :month, :year]
      f.input :email
      f.input :phone_number, input_html: { data: { mask: '+7 (000) 000-00-00' }}
      f.input :address
      f.input :marital_status, as: :select,  collection: ["Free"]
      f.input :gender, as: :select, collection: ["Male", "Female", "None"]
      f.input :username
      f.input :password
      f.input :password_confirmation

    end
    f.actions
  end

end