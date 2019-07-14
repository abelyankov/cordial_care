ActiveAdmin.register Group do
  permit_params :name, :location, members_attributes: [:user_id, :member_role_id, :id, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :location
    column :current_sign_in_at, :sortable => :created_at do |obj|
      obj.created_at.localtime
    end
    column :sign_in_count, :sortable => :created_at do |obj|
      obj.created_at.localtime
    end
    column :created_at, :sortable => :created_at do |obj|
      obj.created_at.localtime
    end
    column :status
    actions
  end


  show do |entity|
    attributes_table do
      row :name
      row :location
    end

    panel "Group of members" do
      entity.members.each do |member|
        div do
          div member.user.full_name
          div member.role.name
        end
      end
    end
  end
  form do |f|
    f.inputs :multipart => true do
      f.input :name
      f.input :location
    end

    f.has_many :members, heading: "Group of members", allow_destroy: true do |worker|
      worker.input :user, as: :select2, collection: User.all.map{ |user| [user.full_name, user.id] }
      worker.input :role, as: :select2, collection: MemberRole.all.map{ |role| [role.name, role.id] }
    end
    f.actions
  end
end