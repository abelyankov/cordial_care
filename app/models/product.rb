class Product < ApplicationRecord
  belongs_to :category, class_name: "ProductCategory", foreign_key: "product_category_id"
  belongs_to :brand
  before_save :generate_product_code
  has_many :sales, inverse_of: :product
  has_many :sales_products, inverse_of: :product
  validates_uniqueness_of :code

  private

  def generate_product_code
    self.category.parent.descendants.each_with_index do |a, v|
      if a.name == self.category.name
        @index = v+1
      end
    end

    if Product.all.count == 0
      digits = 0
    else
      digits = Product.all.count + 1
    end

    if Product.find_by(code: self.code).present?
      digits = Product.all.count
    end

    code = self.category.short_name + "#{@index}" +"%.3i" %digits
    self.code = code
  end
end
