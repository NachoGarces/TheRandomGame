require "application_system_test_case"

class NicknamesTest < ApplicationSystemTestCase
  setup do
    @nickname = nicknames(:one)
  end

  test "visiting the index" do
    visit nicknames_url
    assert_selector "h1", text: "Nicknames"
  end

  test "creating a Nickname" do
    visit nicknames_url
    click_on "New Nickname"

    fill_in "Nick", with: @nickname.nick
    fill_in "Player", with: @nickname.player_id
    fill_in "Site", with: @nickname.site_id
    click_on "Create Nickname"

    assert_text "Nickname was successfully created"
    click_on "Back"
  end

  test "updating a Nickname" do
    visit nicknames_url
    click_on "Edit", match: :first

    fill_in "Nick", with: @nickname.nick
    fill_in "Player", with: @nickname.player_id
    fill_in "Site", with: @nickname.site_id
    click_on "Update Nickname"

    assert_text "Nickname was successfully updated"
    click_on "Back"
  end

  test "destroying a Nickname" do
    visit nicknames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nickname was successfully destroyed"
  end
end
