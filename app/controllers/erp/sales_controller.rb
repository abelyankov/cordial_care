module Erp
  class SalesController < BaseController
    require 'date_extensions'
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
      @sale.seller_id = params[:sale][:seller_id]
      if params[:sale][:sale_type_id].to_i == SaleType.find_by(name: "Self purchasing").id
        @sale.buyer_id = params[:sale][:seller_id]
      else
        @sale.buyer_id = params[:sale][:buyer_id]
      end
      seller = Member.find_by(id: params[:sale][:seller_id])
      @sale.team = seller.team
      @sale.sale_date = params[:sale][:sale_date]
      permitted_items = params.require(:sale).permit([items: [:product_id, :quantity]])
      permitted_items.to_h.each do |key, value|
        @items_array = []
        next if String === value
        value.each { |key, value|
          items_id = value[:product_id]
          items_quantity = value[:quantity]
          if @sale.seller_id == @sale.buyer_id
            price = Product.find_by(id: items_id).membership_price_kzt
            amount = items_quantity.to_i * price
          else
            price = Product.find_by(id: items_id).unit_price
            amount = items_quantity.to_i * price
          end
          sales_product = SalesProduct.create(product_id: items_id,
                                              quantity: items_quantity,
                                              amount: amount,
                                              price: price)
          @items_array.push(sales_product.id)
        }
      end
      @items_array
      @sale.sales_product_ids = @items_array

      if @sale.save
        redirect_to sales_path, notice: "Sale ##{@sale.id} created"
      else
        @sale.errors
        render "new"
      end
    end

    def edit
      @sale = Sale.find(params[:id])
    end

    private

    def permitted_params
      params.require(:sale).permit(:sale_type_id, :quantity, product_ids: [])
    end
  end
end