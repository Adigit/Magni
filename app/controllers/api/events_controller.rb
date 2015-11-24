require 'httparty'
require 'json'
class Api::EventsController < ApplicationController
  
  def get_events
     response = URI.parse('https://www.eventbriteapi.com/v3/users/me/owned_events/?token=G5GUSXPTSLQVWWUUQMFZ')
     json = JSON.parse(response)
   # json = JSON.parse('{"data"=>[{"date" => "2014-08-11 11:00:00","name" => "Test Event","reservation_capacity"=>14 }]}') #string representing your json
   # json['events'].each do |element|
    #Event.create(name: element['name']['text'], date: element['start']['utc']) 
  #end
end

end
