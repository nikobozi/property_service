# README

The goal of this task was to build a service that, given latitude and longitude of an object, its type and marketing type, returns a list of similar objects with their prices.  
It was implemented with Ruby on Rails.  
For querying distances between properties, the `activerecord-postgres-earthdistance` gem was used which leverages the PostgreSQL extension `earthdistance`

## Prerequisites
This project was built with Ruby 2.5.1 and Rails 5.2.1 (--api mode).  
In order to run this app, PostgreSQL 9.6+ should be installed, as well as Redis (optional) for testing of caching

## Setup
In order to setup the database, first the `properties.sql` needs to be copied into `db/dump` folder (which is in .gitignore). Then run:
```
rake db:create
rake db:import
rake db:migrate
```
which should populate the database with the data, as well as add the needed PostgreSQL extensions and indexes to the datatbase

## Caching
In order to enable caching locally with Redis, run `rails dev:cache`. Right now the serialized objects are being cached with the `fast_jsonapi` gem.  
Note: maybe a better implementation would have been to add `updated_at` field to the table and leverage caching of the queries (although the sizes would have been bigger)

## API Spec
It has only 1 endpoint:

```
GET /api/v1/find
```
which accepts 4 params; `lat`, `lng`, `property_type`, `marketing_type`. In the current implementation all of them are mandatory. Example
```
{ 
    lng: '13.4132', 
    lat: '52.5219', 
    property_type: 'apartment', 
    marketing_type: 'sell' 
}
```

And the response is :
```
{"data": [
  { "id": "4", "type": "property", 
  "attributes": {
      "house_number": "1", 
      "street": "Alexanderplatz Straße", 
      "city": "Berlin", "zip_code": "10178", 
      "lat": "52.5219", "lng": "13.4132", 
      "price": "990000.0"}, 
      "relationships":  {}
  }
]}
```
