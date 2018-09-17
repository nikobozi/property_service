#
# This model represents a real estate object.
# It uses the Postgres earthdistance module for querying lat and lng attributes
#
class Property < ApplicationRecord
  acts_as_geolocated lat: :lat, lng: :lng

  PROPERTY_TYPES = %w[apartment single_family_house].freeze
  MARKETING_TYPES = %w[rent sell].freeze
  DEFAULT_RADIUS = 5000

  scope :by_coordinates, ->(lat, lng) { within_radius(DEFAULT_RADIUS, lat, lng) }
  scope :by_property_type, ->(property_type) { where(property_type: property_type) }
  scope :by_marketing_type, ->(offer_type) { where(offer_type: offer_type) }
end
