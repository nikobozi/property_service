FactoryBot.define do
  factory :property do
    factory :property_berlin_alexanderplatz do
      house_number '1'
      street 'Alexanderplatz Straße'
      zip_code '10178'
      lng '13.4132'
      lat '52.5219'
      price '990000'
      city 'Berlin'
      property_type 'apartment'
      offer_type 'sell'
    end

    factory :property_tegel do
      house_number '11'
      street 'Pariser Straße'
      zip_code '10117'
      lng '13.2884'
      lat '52.5588'
      price '350000'
      city 'Berlin'
      property_type 'apartment'
      offer_type 'sell'
    end

    factory :property_hamburg do
      house_number '31'
      street 'Altstadt Straße'
      zip_code '20095'
      lng '9.9937'
      lat '53.5511'
      price '350000'
      city 'Hamburg'
      property_type 'apartment'
      offer_type 'sell'
    end
  end
end