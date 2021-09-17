class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def index
    @clients = Client.all
    #@owner = Owner.find(params[:id])
  end

  def show
    @client = Client.find(params[:id])
    @owners = @client.owners

  end

  def create
    @client = Client.new(client_params)
    if @client.save!
      redirect_to clients_path
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def edit
  end

  def update
  end

  def search
    @clients = Client.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private
  def client_params
    params.require(:client).permit(:user_id, :name)
  end

end
