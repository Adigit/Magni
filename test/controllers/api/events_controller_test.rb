require 'test_helper'

class Api::EventsControllerTest < ActionController::TestCase
  test "should get get_events" do
    get :get_events
    assert_response :success
  end

end
