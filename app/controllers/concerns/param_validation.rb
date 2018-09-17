#
# This module handles the validation of user input values through the api to ensure valid queries
#
module ParamValidation
  def params_valid?(params)
    coordinates_valid?(params[:lat], params[:lng]) &&
      property_type_valid?(params[:property_type]) &&
      marketing_type_valid?(params[:marketing_type])
  end

  def coordinates_valid?(lat_string, lng_string)
    # Check if string values are numerical
    return false unless params[:lat] =~ /^[-+]?\d+(([.,])\d+)?$/ && params[:lng] =~ /^[-+]?\d+(([.,])\d+)?$/

    lat = lat_string.to_f
    lng = lng_string.to_f
    lat&.between?(-90, 90) && lng&.between?(-180, 180)
  end

  def property_type_valid?(property_type)
    Property::PROPERTY_TYPES.include?(property_type)
  end

  def marketing_type_valid?(marketing_type)
    Property::MARKETING_TYPES.include?(marketing_type)
  end
end
