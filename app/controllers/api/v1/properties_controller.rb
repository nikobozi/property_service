module Api
  module V1
    #
    # This Controller serves as an endpoint for querying similar properties in an area
    #
    class PropertiesController < ApplicationController
      before_action :check_params
      include ParamValidation

      # GET /api/v1/properties/find
      def find
        @properties = fetch_properties
        if @properties.present?
          render json: PropertySerializer.new(@properties), status: :ok
        else
          render json: {}, status: :no_content
        end
      end

      private

      def fetch_properties
        Property.by_coordinates(params[:lat], params[:lng])
                .by_property_type(params[:property_type])
                .by_marketing_type(params[:marketing_type])
      end

      def check_params
        return if params_valid?(params)

        render(json: { error: 'Invalid input params' }, status: :unprocessable_entity) && return
      end
    end
  end
end
