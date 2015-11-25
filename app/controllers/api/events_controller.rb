class Api::EventsController < ApplicationController

  def get_events
    url = "https://www.eventbriteapi.com/v3/users/me/owned_events/?token=G5GUSXPTSLQVWWUUQMFZ"
    conn = Faraday.new(url: url)
    response = conn.get
    @json = JSON.parse(response.body)
    @
    Event.create()
  end
json.each do |element|
end
end
