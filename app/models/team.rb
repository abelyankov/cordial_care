class Team < ApplicationRecord
  has_many :members, inverse_of: :team
  has_many :users, through: :members
  has_many :sales, inverse_of: :team
  belongs_to :location
  accepts_nested_attributes_for :members, :allow_destroy => true
end
