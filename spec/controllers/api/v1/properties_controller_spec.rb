require 'rails_helper'

RSpec.describe Api::V1::PropertiesController, type: :controller do

  describe "GET #find" do
    it "returns http success" do
      get :find
      expect(response).to have_http_status(:success)
    end
  end

end
