class JsonDataService
  def initialize(url)
    @url = url
  end

  attr_accessor :url, :response

  def get_response
    if @response.nil?
      conn = Faraday.new(url: @url)
      puts "---------------------"
      response = conn.get
      puts "====================="
      @response = JSON.parse(response.body)
    end
    @response
  end

    def create_event_records
    @response ||= get_response
    binding.pry
    @response["events"].each do |event|
      Event.where(name: event["name"]["text"], event_date: event["start"]["utc"].to_datetime).first_or_create
    end
  end

  def create_venue_records
    @response ||= get_response
    venue = @response["show"]["venue"]
    Venue.where(name: venue["name"], address: venue["address"], capacity: venue["capacity"] ).first_or_create if venue.present?
  end
end
