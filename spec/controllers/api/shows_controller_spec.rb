require 'rails_helper'
require 'json_spec'

RSpec.describe Api::ShowsController, type: :controller do

  let(:response_json) {{"show"=>
    {"id"=>941968, 
     "show_time"=>"2015-12-03T20:00:00Z",
     "photo_landscape_100"=>"",
     "photo_small_wide"=>"",
     "ticket_url"=>nil, "you_follow"=>false, 
     "followers_url"=>"https://api.magnifi.fm/api/v3/show/941968/followers?ids=941968&key=23ba38d29a677c2ba361301bd3d525b0",
     "artists_followers_url"=>"https://api.magnifi.fm/v3/artists/followers?show_ids=941968&key=23ba38d29a677c2ba361301bd3d525b0"
     }}}
  before(:each) do
    #request.headers["accept"] = 'application/json'
    allow_any_instance_of(EventService).to receive(:get_response).and_return(JSON.parse(response_json.to_json))
  end

  describe '#index' do
    it "should render the index page" do
      get :show , id: '941968'#,:format => :json
      expect(response).to render_template :show
    end

    it "response code should be success" do
      get :show,id: '941968'
      expect(response.code).to(eq('200'))
    end

    it "should create event entries" do
      expect(Show.count).to eq 0
      get :show,id: '941968'
      expect(Show.count).to(eq(1))
    end

    
end
end
