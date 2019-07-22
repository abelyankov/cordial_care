module Erp
  class SalesController < BaseController

    def index
      @sales = Sale.all
    end

    def show
      @sale = Sale.find(params[:id])
    end

    def new
      @sale = Sale.new
    end

    def create
      @sale = Sale.new(permitted_params)
      @sale.status = :new
      if params[:sale][:sale_type_id] == SaleType.find_by(name: "Self purchasing").id
        @sale.buyer_id = params[:sale][:seller_id]
      else
        @sale.buyer_id = params[:sale][:buyer_id]
      end
      seller = Member.find_by(id: params[:sale][:seller_id])
      @sale.group = seller.group
      @sale.team = seller.team

      permitted_items = params.require(:sale).permit([items: [:product_id, :quantity]])
      permitted_items.to_h.each do |key, value|
        @items_array = []
        next if String === value
        value.each { |key, value|
          items_id = value[:product_id]
          items_quantity = value[:quantity]
          sales_product = SalesProduct.create(product_id: items_id, quantity: items_quantity)
          @items_array.push(sales_product.id)
        }
      end
      p @items_array
      @sale.sales_product_ids = @items_array

      if @sale.save
        redirect_to sales_path, notice: "Sale ##{@sale.id} created"
      else
        p @sale.errors
        render "new"
      end
    end

    def edit
      @sale = Sale.find(params[:id])
    end

    private

    def permitted_params
      params.require(:sale).permit(:sale_type_id, :seller_id, :buyer_id, :quantity, product_ids: [])
    end
  end
end