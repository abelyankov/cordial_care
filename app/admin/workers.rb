ActiveAdmin.register Worker do
  permit_params :user_id, :worker_role_id
  form do |f|
    f.inputs do
      f.input :user_id, as: :select2, collection: User.all.map{ |user| [user.full_name, user.id] }
      f.input :worker_role_id, as: :select2, collection: WorkerRole.all.map{ |role| [role.name, role.id]}
      f.input :group_id, as: :select2, collection: Group.all.map{ |entity| [entity.name, entity.id] }
      f.input :team_id, as: :select2, collection: Team.all.map{ |entity| [entity.name, entity.id] }
      end
    f.actions
  end
end