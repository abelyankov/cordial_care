class Group < ApplicationRecord
  has_many :members, inverse_of: :group
  has_many :users, through: :members
  has_one :team, inverse_of: :groups
  accepts_nested_attributes_for :members, :allow_destroy => true
  has_many :sales
end
