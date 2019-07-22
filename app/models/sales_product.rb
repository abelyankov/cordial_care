class SalesProduct < ApplicationRecord
  belongs_to :productable, polymorphic: true, optional: true
  before_save :calculate_amount
  belongs_to :product, inverse_of: :sales_products

  def calculate_amount
      self.amount =  quantity * self.product.unit_price
  end
end
