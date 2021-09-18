class Form::Material < Material
  REGISTRABLE_ATTRIBUTES = %i(id register material_name order_status order_date)
  attr_accessor :register
end
