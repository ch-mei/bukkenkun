class SalesOutletsController < ApplicationController

  def show
    @sales_outlet = SalesOutlet.find(params[:id])
    @construction_shops = @sales_outlet.construction_shops
    @construction_shop = ConstructionShop.new
    @owners = Owner.all
  end

  #def create
    #ActiveRecord::Base.transaction do
     # @client = Client.new(client_params)
      #@client.save!
      #@sales_outlet = SalesOutlet.new(sales_outlet_params[:sales_outlet])
      #@sales_outlet.save!
    #end
    #redirect_to sales_outlet_path(@sales_outlet.id)
    #rescue => e
      #logger.debug("failed. because of #{e}")
      #redirect_back(fallback_location: root_path)
    #end
  #end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def client_params
    params.require(:client).permit(:user_id)
  end

  def sales_outlet_params
    params.require(:client).permit(sales_outlet:[:client_id, :sales_outlet_name])
  end
end
