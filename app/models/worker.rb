class Worker < ApplicationRecord
  belongs_to :role, class_name: 'WorkerRole', foreign_key: 'worker_role_id'
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :team, optional: true

  def description
    "#{self.role.name} #{self.entity.name}"
  end
end
