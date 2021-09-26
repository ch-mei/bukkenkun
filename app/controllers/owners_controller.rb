class OwnersController < ApplicationController
   before_action :authenticate_user!

  def new
    @owner = Owner.new
    @clients = Client.all
    @material = @owner.materials.build #ownerに紐づくmaterial作成
  end

  def index
    @owners = Owner.all.page(params[:page]).per(10) #ページネーション
  end

  def show
    @owner = Owner.find(params[:id])
    @materials = @owner.materials #ownerに紐づくmaterialをすべて呼び出し
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save!
      redirect_to owner_path(@owner)
    else
      redirect_back
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def material_edit #ownerに紐づくmaterial編集アクション
    @owner = Owner.find(params[:id])
  end

  def material_update #ownerに紐づくmaterial更新アクション
    @owner = Owner.find(params[:id])
    if @owner.update(material_params)
      flash[:success] = "情報を更新しました"
      redirect_to owner_path(@owner)
    else
      render 'material_edit'
    end
  end

  def material_create #ownerに紐づくmaterial作成アクション
    @owner = Owner.find(params[:id])
    @material = @owner.materials.build
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy!
    redirect_to owners_path
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      flash[:success] = "情報を更新しました"
      redirect_to owner_path(@owner)
    else
      render 'edit'
    end
  end

  def search
    @owners = Owner.search(params[:keyword]).page(params[:id]).per(10) #検索結果の画面にもページネーション
    @keyword = params[:keyword]
    render "index" #検索窓
  end

  private
  def owner_params
    params.require(:owner).permit(:client_id, :name, materials_attributes: [:id, :material_name, :order_status, :order_date, :_destroy]) #owner作成時にmaterials_attributesの中身も作成
  end

  def material_params
    params.require(:owner).permit(materials_attributes: [:id, :material_name, :order_status, :order_date, :updated_at, :_destroy]) #owner作成時にmaterials_attributesの中身も作成
  end
end
