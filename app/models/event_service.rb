class EventService
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

  def create_records
    @response ||= get_response
    binding.pry
    @response["events"].each do |event|
      Event.where(name: event["name"]["text"], event_date: event["start"]["utc"].to_datetime).first_or_create
    end
  end
end
