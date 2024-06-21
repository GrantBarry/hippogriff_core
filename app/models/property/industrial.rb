class Property::Industrial < Property
  def usage_values
    %i[acreage development farming warehouse land medical offices retail_store rural showrooms other]
  end

  # List only the area attributs which are valid for this property type
  def building_area_attributes
    %i[office_area warehouse_area showroom_area production_area]
  end
end
