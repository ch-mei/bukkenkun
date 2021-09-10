class ClientsController < ApplicationController
  def new
    @sales_outlet = SalesOutlet.new
    @construction_shop = ConstructionShop.new
  end

  def index
    @sales_outlets = SalesOutlet.all
    @construction_shops = ConstructionShop.all
  end

  def show

  end

  def create

  end

  def edit
  end

  def update
  end

end
