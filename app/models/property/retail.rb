class Property::Retail < Property
  def usage_values
    %i[acreage apartment development farming hotel house warehouse land medical offices retail_store rural showrooms townhouse villa other]
  end

  # List only the area attributs which are valid for this property type
  def building_area_attributes
    %i[office_area storage_area trading_area]
  end
end
