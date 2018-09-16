class Api::V1::PropertiesController < ApplicationController
  has_scope :by_property_type, as: 'property_type'
  has_scope :by_marketing_type, as: 'marketing_type'

  def find
    @property = apply_scopes(Property).all.to_a
    render json: @property.to_json
  end
end
