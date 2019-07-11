class Team < ApplicationRecord
  has_many :workers, inverse_of: :team
  has_many :groups, inverse_of: :team
  has_many :users, through: :workers
  accepts_nested_attributes_for :workers, :allow_destroy => true
end
