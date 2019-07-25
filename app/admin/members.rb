ActiveAdmin.register Member do
  permit_params :user_id, :member_role_id, :team_id

  form do |f|
    f.inputs do
      f.input :user_id, as: :select2, collection: User.all.map{ |user| [user.full_name, user.id] }
      f.input :member_role_id, as: :select2, collection: MemberRole.all.map{ |role| [role.name, role.id]}
      f.input :team_id, as: :select2, collection: Team.all.map{ |entity| [entity.name, entity.id] }
    end
    f.actions
  end
end