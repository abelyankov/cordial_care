class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :member_role, null: false
      t.references :user, null: false
      t.references :group
      t.references :team
      t.references :location
      t.timestamps
    end
  end
end
