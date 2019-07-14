class Sale < ApplicationRecord

  enum status: SaleStatus.all.map{ |s| [s.to_sym, s.to_sym.to_s] }.to_h, _suffix: true
  belongs_to :type, class_name: "SaleType", foreign_key: "sale_type_id"
  belongs_to :brand, inverse_of: :sales
  belongs_to :product, inverse_of: :sales
  belongs_to :team, inverse_of: :sales
  belongs_to :group, inverse_of: :sales
  belongs_to :seller, class_name: "Member"
  belongs_to :buyer, class_name: "Member"

  validates_presence_of :status, :seller, :buyer, :type

  before_validation :set_status_to_new, :calculate_amount

  def status
    SaleStatus.new(read_attribute(:status)) if read_attribute(:status).present?
  end

  def set_status_to_new
    self.status = :new if read_attribute(:status).nil?
  end

  def calculate_amount
    self.amount =  quantity * self.product.unit_price
  end
end
