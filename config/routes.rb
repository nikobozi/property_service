Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'properties/find'
    end
  end
end
