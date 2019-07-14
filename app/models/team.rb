class Team < ApplicationRecord
  has_many :members, inverse_of: :team
  has_many :groups, inverse_of: :team
  has_many :users, through: :members
  accepts_nested_attributes_for :members, :allow_destroy => true
end
