class OwnersController < ApplicationController

  def new
    @owner = Owner.new
    @clients = Client.all
    @material = @owner.materials.build #ownerに紐づくmaterial作成
  end

  def index
    @owners = Owner.all.page(params[:page]).per(10)
  end

  def show
    @owner = Owner.find(params[:id])
    @materials = @owner.materials
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
    @form = Form::MaterialCollection.new
    pp @form.materials
  end

  def material_edit
    @owner = Owner.find(params[:id])
  end

  def material_update
    @owner = Owner.find(params[:id])

    @owner.update(material_params)
    redirect_to owner_path(@owner)
  end

  def material_create
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
    @owner.update(owner_params)
    redirect_to owner_path(@owner)
  end

  def search
    @owners = Owner.search(params[:keyword]).page(params[:id]).per(10)
    @keyword = params[:keyword]
    render "index"
  end

  private
  def owner_params
    params.require(:owner).permit(:client_id, :name, materials_attributes: [:id, :material_name, :order_status, :order_date, :_destroy])
  end

  def material_params
    params.require(:owner).permit(materials_attributes: [:id, :material_name, :order_status, :order_date, :updated_at, :_destroy])
  end
end
