class WorkerRole < ApplicationRecord
  validates_uniqueness_of :name
end
