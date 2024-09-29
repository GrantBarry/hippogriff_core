module PropertiesHelper
  def property_types(form)
    types = %w[Property::Industrial Property::Commercial Property::Retail Property::Residential]
    form.select :type, types.map { |type|
                         [type.titleize, type]
                       }, { include_blank: true }, class: 'form-control'
  end
end
