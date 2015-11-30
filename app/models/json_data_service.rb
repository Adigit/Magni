class JsonDataService
  def initialize(url)
    @url = url
  end

  attr_accessor :url, :response

  def get_response
    if @response.nil?
      conn = Faraday.new(url: @url)
      response = conn.get
      @response = JSON.parse(response.body)
    end
    @response
  end

    def create_event_records
    @response ||= get_response
      Show.where(sid: @response['show']['id'],show_date: @response['show']['show_time'].to_datetime).first_or_create
  end

  def create_venue_records
    @response ||= get_response
    venue = @response["venue"]
    Venue.where(name: venue["name"], address: venue["address"], capacity: venue["capacity"] ).first_or_create if venue.present?
  end
end
