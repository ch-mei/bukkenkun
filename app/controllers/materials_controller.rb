class MaterialsController < ApplicationController

  def index
    @materials = Material.all.page(params[:page]).per(10)
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
 
  def update_all
    @owner = Owner.find(material_collection_params[:owner_id])
    @form = Form::MaterialCollection.new
    material_collection_params['materials_attributes'].each do |material|
      pp material
      unless @owner.owner_materials.find_by(material_id: material[1][:id].to_i) #なければcreateあったらupdate
        @owner.owner_materials.create(material_id: material[1][:id].to_i)
      end
    end
    if @form.update(material_collection_params['materials_attributes']) #いらなくなる
      redirect_to owner_path(@owner)
    else
      redirect_back(fallback_location: root_path)
    end
  end


  def update
    @material = Material.find(params[:id]) 
    @material.update(material_params) 
    redirect_to materials_path
  end
  
  #@materials = Material.where(material_name: params[:material][:material_name])
  #materials.each do |material|
    #material.update(material_params)
  #end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path
  end

  private
  def material_params
    params.require(:material).permit(:material_name)
  end

  def material_collection_params
    params
      .require(:form_material_collection)
      .permit(:owner_id, materials_attributes: Form::Material::REGISTRABLE_ATTRIBUTES)
  end
end
