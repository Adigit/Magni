require 'rails_helper'

RSpec.describe Api::VenuesController, type: :controller do
  let(:response_json) {
    {
      "venue":{
      "id":213778,
      "name":"NH7 Weekender",
      "address":nil,
      "latitude":18.5333333,
      "longitude":73.8666667,
      "city":"Pune",
      "province":"16",
      "country":"IN",
      "station_title":"NH7 Weekender Radio",
      "website_url":nil,
      "facebook_page_url":nil,
      "twitter_username":nil,
      "capacity":0,
      "slug":"nh7-weekender-radio-5",
      "description":nil,
      "venue_banner_url":nil,
      "you_follow":false,
      "has_music":true,
      "total_artist_count":2,
      "official_station_id":369372
      }
    }
  }

  before(:each) do
    allow_any_instance_of(JsonDataService).to receive(:get_response).and_return(JSON.parse(response_json.to_json))
  end

  describe '#show' do
    it "should render the show page" do
      get :show, id: '213778'
      expect(response).to render_template :show
    end

    it "response code should be success" do
      get :show, id: '213778'
      expect(response.code).to eq '200'
    end

    it "should create venue entries" do
      expect(Venue.count).to eq 0
      get :show, id: '213778'
      expect(Venue.count).to eq 1
    end
  end
end
