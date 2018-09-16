class Property < ApplicationRecord
  acts_as_geolocated lat: :lat, lng: :lng
  validates :lat, :lng, :zip_code, :city, :offer_type, :property_type, presence: true
end
