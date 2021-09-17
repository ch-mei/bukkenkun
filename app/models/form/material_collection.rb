class Form::MaterialCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :materials

  def initialize(attributes = {})
    super attributes
    self.materials = DEFAULT_ITEM_COUNT.times.map { Form::Material.new } unless materials.present?
  end

  def materials_attributes=(attributes)
    self.materials = attributes.map do |_, material_attributes|
      Form::Material.new(material_attributes).tap { |v| v.order_status = false }
    end
  end

  def valid?
    valid_materials = target_materials.map(&:valid?).all?
    super && valid_materials
  end

  def save
    return false unless valid?
    Material.transaction { target_materials.each(&:save!) }
    true
  end

  def target_materials
    self.materials.select { |v| value_to_boolean(v.register) }
  end
  
end
