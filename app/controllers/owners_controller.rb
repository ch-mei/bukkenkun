class OwnersController < ApplicationController
  def index
    @owners = Owner.all.page(params[:page]).per(10)

  end

  def show
    @owner = Owner.find(params[:id])
    @materials = Material.all

  def create
    @owner = Owner.new(owner_params)
    if @owner.save!
      redirect_to owner_path(@owner)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def new
    @owner = Owner.new
    @clients = Client.all
  end

  def edit
    @owner = Owner.find(params[:id])
    @form = Form::MaterialCollection.new
    pp @form.materials
  end

  def destroy
  end

  def update
    @owner = Owner.find(params[:id])
    @owner.upate
    redirect_to owner_path(@owner)
  end

  def search
    @owners = Owner.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private
  def owner_params
    params.require(:owner).permit(:client_id, :name, :material_id)
  end
end
