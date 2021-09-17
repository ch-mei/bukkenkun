class Form::Material < Material
  REGISTRABLE_ATTRIBUTES = %i(register material_name order_status order_date)
  attr_accessor :register
end
