namespace :db do
  task :import do
    system('psql  -h localhost -d property_service_development -f db/dump/properties.sql')
  end
end