require 'rails_helper'
require 'json_spec'

RSpec.describe Api::EventsController, type: :controller do

  let(:response_json) {{
    "pagination": {
        "object_count": 1, 
        "page_number": 1, 
        "page_size": 50, 
        "page_count": 1
    }, 
    "events": [
        {
            "name": {
                "text": "Test", 
                "html": "Test"
            }, 
            "description": {
                "text": "Test event for api ", 
                "html": "<P>Test event for api<\/P>"
            }, 
            "id": "19702702313", 
            "url": "http://www.eventbrite.com/e/test-tickets-19702702313", 
            "start": {
                "timezone": "Asia/Kolkata", 
                "local": "2015-11-24T19:00:00", 
                "utc": "2015-11-24T13:30:00Z"
            }, 
            "end": {
                "timezone": "Asia/Kolkata", 
                "local": "2015-11-24T22:00:00", 
                "utc": "2015-11-24T16:30:00Z"
            }, 
            "created": "2015-11-24T05:46:03Z", 
            "changed": "2015-11-24T05:46:03Z", 
            "capacity": 0, 
            "status": "draft", 
            "currency": "USD", 
            "listed": false, 
            "shareable": false, 
            "invite_only": false, 
            "online_event": false, 
            "show_remaining": false, 
            "tx_time_limit": 480, 
            "hide_start_date": false, 
            "locale": "en_US", 
            "is_locked": false, 
            "privacy_setting": "unlocked", 
            "resource_uri": "https://www.eventbriteapi.com/v3/events/19702702313/"
        }
    ]
}}
  before(:each) do
    #request.headers["accept"] = 'application/json'
    allow_any_instance_of(EventService).to receive(:get_response).and_return(JSON.parse(response_json.to_json))
  end

  describe '#index' do
    it "should render the index page" do
      get :index#,:format => :json
      expect(response).to render_template :index
    end

    it "response code should be success" do
      get :index
      expect(response.code).to eq '200'
    end

    it "should create event entries" do
      expect(Event.count).to eq 0
      get :index
      expect(Event.count).to eq 1
    end

    
end
end
