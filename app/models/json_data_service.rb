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
    Show.where(sid: @response['show']['id']).first_or_create do |s|
      s.show_date = @response['show']['show_time'].to_datetime
    end
  end

  def create_venue_records
    @response ||= get_response
    venue = @response["venue"]
    Venue.where(vid: venue["id"]).first_or_create do |v|
      v.name = venue["name"]
      v.address = venue["address"]
      v.capacity = venue["capacity"]
    end
  end
end
