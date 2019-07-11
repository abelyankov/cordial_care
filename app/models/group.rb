class Group < ApplicationRecord
  has_many :workers, inverse_of: :group
  has_many :users, through: :workers
  has_one :team, inverse_of: :groups
  accepts_nested_attributes_for :workers, :allow_destroy => true
  
end
