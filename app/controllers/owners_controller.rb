class OwnersController < ApplicationController
  def index
    @owners = Owner.all

  end

  def show
    @owner = Owner.find(params[:id])
    @materials = Material.all
  end

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
    @materials = Material.all
    #@material = Material.

  end

  def destroy
  end

  def update
    @owner = Owner.find(params[:id])
    @owner.upate
    redirect_to owner_path(@owner)
  end

  private
  def owner_params
    params.require(:owner).permit(:client_id, :name, :material_id)
  end
end
