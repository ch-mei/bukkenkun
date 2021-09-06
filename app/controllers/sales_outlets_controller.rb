class SalesOutletsController < ApplicationController

  def show
  end

  def create
    @sales_outlet = SalesOutlet.new(sales_outlet_params)
    if @sales_outlet.save
      redirect_to sales_outlet_path(@sales_outlet.id)
    else
      render 'clients/new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def sales_outlet_params
    params.require(:sales_outlet).permit(:client_id, :sales_outlet_name)
  end
end
