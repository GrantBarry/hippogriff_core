class Property::Commercial < Property
  def usage_values
    %i[farming hotel warehouse land_development medical offices retail_store showrooms other]
  end

  # List only the area attributs which are valid for this property type
  def building_area_attributes
    %i[office_area storage_area]
  end
end
