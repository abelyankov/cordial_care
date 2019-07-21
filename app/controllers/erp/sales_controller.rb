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

    end
  end
end