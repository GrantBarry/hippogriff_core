class Property::Residential < Property
  def usage_values
    %i[acreage apartment flat house land retirement rural service_apartment studio townhouse unit villa other]
  end

  # List only the area attributs which are valid for this property type
  def building_area_attributes
    %i[floor_area]
  end
end
