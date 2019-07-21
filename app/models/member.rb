class Member < ApplicationRecord
  belongs_to :role, class_name: 'MemberRole', foreign_key: 'member_role_id'
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :team, optional: true
  belongs_to :location
  has_many :sellers, class_name: "Sale", foreign_key: "seller_id"
  has_many :buyers, class_name: "Sale", foreign_key: "buyer_id"


  def member_full_name
    "##{self.id}"
  end

  def description
    "#{self.role.name} #{self.entity.name}"
  end
end
