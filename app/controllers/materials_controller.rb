class MaterialsController < ApplicationController

  def index
    @materials = Material.all
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save!
      redirect_to materials_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    @material.update(material_params)
    redirect_to materials_path
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path
  end

  private
  def material_params
    params.require(:material).permit(:material_name)
  end
end
