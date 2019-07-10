class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.references :worker_role, null: false
      t.references :user, null: false
      t.references :group
      t.references :team
      t.timestamps
    end
  end
end
