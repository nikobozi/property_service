class Property < ApplicationRecord
  acts_as_geolocated lat: :lat, lng: :lng
  validates :lat, :lng, :zip_code, :city, :offer_type, :property_type, presence: true

  DEFAULT_RADIUS = 5

  scope :by_distance, ->(lat, lng) { within_radius(DEFAULT_RADIUS, lat, lng) }
  scope :by_property_type, ->(property_type) { where(property_type: property_type) }
  scope :by_marketing_type, ->(offer_type) { where(offer_type: offer_type) }
end
