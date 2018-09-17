require 'rails_helper'

RSpec.describe Api::V1::PropertiesController, type: :controller do

  describe 'GET /api/v1/find' do
    context 'with params sent' do
      let(:params) { { lng: '13.5332', lat: '52.1234', property_type: 'apartment', marketing_type: 'sell' } }

      context 'no matching apartments found' do
        it 'returns http status no_content' do
          get :find, params: params
          expect(response).to have_http_status(:no_content)
        end

        it 'returns empty body' do
          get :find, params: params
          expect(JSON.parse(response.body)).to be_empty
        end
      end

      context 'matching apartments found' do
        let(:params_alexanderplatz) { { lng: '13.4132', lat: '52.5219', property_type: 'apartment', marketing_type: 'sell' } }
        let!(:alexanderplatz)  { create(:property_berlin_alexanderplatz) }
        let!(:tegel)           { create(:property_tegel) }
        let!(:hamburg)         { create(:property_hamburg) }

        it 'returns http status success' do
          get :find, params: params
          expect(response).to have_http_status(:success)
        end

        it 'returns one matching apartment' do
          get :find, params: params_alexanderplatz
          json = JSON.parse(response.body)

          expect(json['data'].count).to eq 1
          expect(JSON.parse(response.body)).to eql(
            {"data"=>[
              { "id"=>"4", "type"=>"property", "attributes"=>{
                  "house_number"=>"1", "street"=>"Alexanderplatz Straße", "city"=>"Berlin", "zip_code"=>"10178", "lat"=>"52.5219", "lng"=>"13.4132", "price"=>"990000.0"}, "relationships"=> {}
              }
            ]}
          )
        end
      end

      context 'partial params sent' do
        it 'returns http status unprocessable_entity' do
          params = { lng: '13.4236807', lat: '52.5342963' }
          get :find, params: params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'no params sent' do
      it 'returns http status unprocessable_entity' do
        get :find
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
