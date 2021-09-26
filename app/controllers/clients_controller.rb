class ClientsController < ApplicationController
  before_action :authenticate_user!

  def new
    @client = Client.new
  end

  def index
    @clients = Client.all.page(params[:page]).per(10) #ページネーション
  end

  def show
    @client = Client.find(params[:id])
    @owners = @client.owners.page(params[:page]).per(10 )#ページネーション

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
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:success] = "情報を更新しました"
       redirect_to client_path(@client)
    else
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  def search
    @clients = Client.search(params[:keyword]).page(params[:page]).per(10) #検索結果の画面にもページネーション
    @keyword = params[:keyword]
    render "index" #検索窓
  end

  private
  def client_params
    params.require(:client).permit(:user_id, :name)
  end

end
