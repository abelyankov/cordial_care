class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]

  before_validation :purify_phone_number
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :phone_number
  validates_uniqueness_of :phone_number
  validates_presence_of :email
  validates_uniqueness_of :email
  has_many :workers
  has_many :entities, through: :workers

  def purify_phone_number
    self.phone_number = self.phone_number.tr('^0-9', '')
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
