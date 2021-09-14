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

  end

  def edit
  end

  def destroy
  end

  def update
  end

  private
  def owner_params
    params.require(:owner).permit(:client_id, :name)
  end
end
