require 'test_helper'

class TypetournamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @typetournament = typetournaments(:one)
  end

  test "should get index" do
    get typetournaments_url
    assert_response :success
  end

  test "should get new" do
    get new_typetournament_url
    assert_response :success
  end

  test "should create typetournament" do
    assert_difference('Typetournament.count') do
      post typetournaments_url, params: { typetournament: { typetournamentname: @typetournament.typetournamentname } }
    end

    assert_redirected_to typetournament_url(Typetournament.last)
  end

  test "should show typetournament" do
    get typetournament_url(@typetournament)
    assert_response :success
  end

  test "should get edit" do
    get edit_typetournament_url(@typetournament)
    assert_response :success
  end

  test "should update typetournament" do
    patch typetournament_url(@typetournament), params: { typetournament: { typetournamentname: @typetournament.typetournamentname } }
    assert_redirected_to typetournament_url(@typetournament)
  end

  test "should destroy typetournament" do
    assert_difference('Typetournament.count', -1) do
      delete typetournament_url(@typetournament)
    end

    assert_redirected_to typetournaments_url
  end
end
