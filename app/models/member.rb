class Member < ApplicationRecord
  belongs_to :role, class_name: 'MemberRole', foreign_key: 'member_role_id'
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :team, optional: true

  def description
    "#{self.role.name} #{self.entity.name}"
  end
end
