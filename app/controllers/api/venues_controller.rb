class Api::VenuesController < ApplicationController

  def index
    url = "https://api.magnifi.fm/api/v3/show/946146?key=23ba38d29a677c2ba361301bd3d525b0"
    service = JsonDataService.new(url)
    service.create_venue_records
    @response = service.response
  end

end
