class Product < ApplicationRecord
  belongs_to :product_category
  validates_uniqueness_of :code
end
