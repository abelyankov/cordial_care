module Erp
  class SalesController < BaseController
    require 'date_extensions'
    def index
      @sales = Sale.all
    end

    def show
      @sale = Sale.find(params[:id])
    end

    def select_type
      @sale_types = SaleType.all
    end

    def new
      @sale = Sale.new
      @sale.sale_type_id = params[:sale_type_id]
      # @sale.buyer.build
    end

    def create
      @sale = Sale.new(permitted_params)
      @sale.status = :new
      @sale.sale_type_id = params[:sale][:sale_type_id]
      @sale.seller_id = params[:sale][:seller_id]
      if params[:sale][:sale_type_id].to_i == SaleType.find_by(name: "Self purchasing").id
        @sale.buyer_id = params[:sale][:seller_id]
      elsif params[:sale][:sale_type_id].to_i == SaleType.find_by(name: "Membership new").id
        b = Member.new(username: params[:sale][:member][:username],
                       first_name: params[:sale][:member][:first_name],
                       last_name: params[:sale][:member][:last_name],
                       email: params[:sale][:member][:email],
                       birthday: params[:sale][:member][:birthday],
                       phone_number: params[:sale][:member][:phone_number],
                       member_role_id: params[:sale][:member][:member_role_id],
                       team_id: params[:sale][:member][:team_id],
                       gender: params[:sale][:member][:gender],
                       marital_status: params[:sale][:member][:marital_status],
                       address: params[:sale][:member][:address],
                       password: params[:sale][:member][:password],
                       password_confirmation: params[:sale][:member][:password_confirmation])
        b.generate_membership_id
        if b.save
          @sale.buyer_id = b.id
        else
         p b.errors
        end
      else
        @sale.buyer_id = params[:sale][:buyer_id]
      end
      if @sale.seller_id == @sale.buyer_id
        @sale.sale_type_id = SaleType.find_by(name: "Self purchasing").id
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

        render "new", notice: "#{@sale.errors}"
      end
    end

    def edit
      @sale = Sale.find(params[:id])
    end

    private

    def permitted_params
      params.require(:sale).permit(:quantity,
                                   product_ids: [])
    end
  end
end
