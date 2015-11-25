require 'rails_helper'

RSpec.describe Api::VenuesController, type: :controller do
  let(:response_json) {
    {"show": {"id":946146,
    "show_time":"2015-12-06T19:00:00Z",
    "photo_landscape_100":"https://assets0.deliradio.com/uploads/picture/band/23110/81572/landscape_100_375c7eb1-1a05-41e8-9357-d018d56a84c1.jpg",
    "photo_small_wide":"https://assets1.deliradio.com/uploads/picture/band/23110/81572/small_wide_375c7eb1-1a05-41e8-9357-d018d56a84c1.jpg",
    "ticket_url":"http://api.magnifi.fm/go?t=66bf5175dbc3487dd1940cd25deb4f6b326e8492e7880b6d",
    "you_follow":false,
    "followers_url":"https://api.magnifi.fm/api/v3/show/946146/followers?ids=946146&key=23ba38d29a677c2ba361301bd3d525b0",
    "artists_followers_url":"https://api.magnifi.fm/v3/artists/followers?show_ids=946146&key=23ba38d29a677c2ba361301bd3d525b0",
      "venue":{
      "id":213778,
      "name":"NH7 Weekender",
      "city":"Pune, 16, IN",
      "address":nil,
      "lat":"18.5333333",
      "lng":"73.8666667",
      "slug":"nh7-weekender-radio-5",
      "twitter_username":nil,
      "capacity":0,
      "description":"",
      "website_url":nil,
      "you_follow":false
      },
      "artist":{
      "id":23110,
      "name":"Rodrigo y Gabriela",
      "hometown":"Ixtapa, JAL, MX",
      "slug":"rodrigo-y-gabriela",
      "genres":[
        "Rock",
        "Indie"
        ],
      "tracks_count":2
      }
    }
    }
  }

  before(:each) do
    allow_any_instance_of(JsonDataService).to receive(:get_response).and_return(JSON.parse(response_json.to_json))
  end

  describe '#index' do
    it "should render the index page" do
      get :index
      expect(response).to render_template :index
    end

    it "response code should be success" do
      get :index
      expect(response.code).to eq '200'
    end

    it "should create venue entries" do
      expect(Venue.count).to eq 0
      get :index
      expect(Venue.count).to eq 1
    end
  end
end
