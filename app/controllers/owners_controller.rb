class OwnersController < ApplicationController

  def new
    @owner = Owner.new
    @clients = Client.all
    @material = @owner.materials.build
  end

  def index
    @owners = Owner.all.page(params[:page]).per(10)

  end

  def show
    @owner = Owner.find(params[:id])
    #@materials = Material.all
    @materials = @owner.materials
    #@materials.each do |a|
     # p a
    #end
  end

  def create
    @owner = Owner.new(owner_params)
    binding.pry
    if @owner.save!
      redirect_to owner_path(@owner)
    else
      redirect_back(fallback_location: root_path)
    end
  end



  def edit
    @owner = Owner.find(params[:id])
    @form = Form::MaterialCollection.new
    pp @form.materials
  end

  def material_edit
    @owner = Owner.find(params[:id])
    @material = @owner.material.build
  end

  def material_create

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
    @owners = Owner.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private
  def owner_params
    params.require(:owner).permit(:client_id, :name, materials_attributes: [:id, :material_name, :order_status, :order_date, :_destroy])
  end
end
