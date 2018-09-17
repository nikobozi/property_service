module Api
  module V1
    class PropertySerializer
      include FastJsonapi::ObjectSerializer
      attributes :house_number, :street, :city, :zip_code, :lat, :lng, :price
      cache_options enabled: true, cache_length: 12.hours
    end
  end
end
