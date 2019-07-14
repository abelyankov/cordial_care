class MemberRole < ApplicationRecord
  validates_uniqueness_of :name
end
