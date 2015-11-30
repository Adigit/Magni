class Api::ShowsController < ApplicationController

  def show
    url = Rails.application.secrets.magnifi_uri + "show/" + params[:id]+"/?key=" + Rails.application.secrets.api_key
    service = EventService.new(url)
    service.create_records
    @response = service.response
  end
end
