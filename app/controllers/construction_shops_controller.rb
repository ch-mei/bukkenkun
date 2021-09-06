class ConstructionShopsController < ApplicationController
  def show
  end

  def edit
  end
  
  def create
    @construction_shop = ConstructionShop.new(construction_shop_params)
    @construction_shop.save
    redirect_to construction_shop_path(@construction_shop.id)
  end

  def update
  end

  def destroy
  end
  
  private
  def construction_shop_params
    params.require(:construction_shop).permit(:client_id, :sales_outlet_id, :construction_shop_name)
  end
end
