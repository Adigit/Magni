class Api::VenuesController < ApplicationController

  def show
    url = Rails.application.secrets.magnifi_uri + "venue/" + params[:id]
    service = JsonDataService.new(url)
    service.create_venue_records
    @response = service.response
  end

end
	