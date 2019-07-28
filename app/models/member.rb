class Member < ApplicationRecord

  devise :database_authenticatable, :trackable, :lockable, :rememberable, :validatable, authentication_keys: [:username]

  belongs_to :role, class_name: 'MemberRole', foreign_key: 'member_role_id'
  belongs_to :team, optional: true
  has_many :sellers, class_name: "Sale", foreign_key: "seller_id"
  has_many :buyers, class_name: "Sale", foreign_key: "buyer_id"

  before_validation :purify_phone_number
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :phone_number
  validates_uniqueness_of :phone_number
  validates_presence_of :email
  validates_uniqueness_of :email

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def description
    "#{self.role.name} #{self.entity.name}"
  end

  def purify_phone_number
    self.phone_number = self.phone_number.tr('^0-9', '')
  end
end
