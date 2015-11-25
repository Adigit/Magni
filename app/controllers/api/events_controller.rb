class Api::EventsController < ApplicationController

  def index
    url = "https://www.eventbriteapi.com/v3/users/me/owned_events/?token=G5GUSXPTSLQVWWUUQMFZ"
    #url = params[:url]
    service = EventService.new(url)
    service.create_records
    @response = service.response
  end
end
