ActiveAdmin.register Group do
  permit_params :name, :location, workers_attributes: [:user_id, :worker_role_id, :id, :_destroy]

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

    panel "Group workers" do
      entity.workers.each do |worker|
        div do
          div worker.user.full_name
          div worker.role.name
        end
      end
    end
  end
  form do |f|
    f.inputs :multipart => true do
      f.input :name
      f.input :location
    end

    f.has_many :workers, heading: "Group workers", allow_destroy: true do |worker|
      worker.input :user, as: :select2, collection: User.all.map{ |user| [user.full_name, user.id] }
      worker.input :role, as: :select2, collection: WorkerRole.all.map{ |role| [role.name, role.id] }
    end
    f.actions
  end
end