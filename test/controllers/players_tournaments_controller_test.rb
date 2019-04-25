require 'test_helper'

class PlayersTournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get players_tournaments_create_url
    assert_response :success
  end

end
