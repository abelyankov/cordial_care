class Group < ApplicationRecord
  has_many :workers, inverse_of: :group
  has_many :users, through: :workers
  accepts_nested_attributes_for :workers, :allow_destroy => true
end
