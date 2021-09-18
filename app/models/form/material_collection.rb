class Form::MaterialCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :materials

  def initialize(attributes = {})
    super attributes
    self.materials = Material.all #materialのレコードをすべて取得
  end

  def materials_attributes=(attributes)
    self.materials = attributes.map do |_, material_attributes|
      Form::Material.new(material_attributes).tap { |v| v.order_status = false }
    end
  end

  def update(attributes)
    attributes.each do |attribute|
      material = Material.find(attribute.last['id'])
      material.attributes = { order_status: attribute.last['order_status'] == 'true', order_date: attribute.last['order_date'] }
      material.save
    end
  end

  def valid?
    valid_materials = target_materials.map(&:valid?).all?
    super && valid_materials
  end

  def save!
    return false unless valid?
    Material.transaction { target_materials.each(&:save!) }
    true
  end

  def target_materials
    self.materials.select { |v| value_to_boolean(v.register) }
  end

end
