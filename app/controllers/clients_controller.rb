class ClientsController < ApplicationController
  def new
    @owner = Owner.new
  end

  def index
    @clients = Client.all
  end

  def show
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to client_path(@client.id)
  end

  def edit
  end

  def update
  end

  private
  def client_params
    params.require(:client).permit(:user_id, :sales_outlet, :construction_shop)
  end

end
