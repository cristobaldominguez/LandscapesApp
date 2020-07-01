require "application_system_test_case"

class LandscapesTest < ApplicationSystemTestCase
  setup do
    @landscape = landscapes(:one)
  end

  test "visiting the index" do
    visit landscapes_url
    assert_selector "h1", text: "Landscapes"
  end

  test "creating a Landscape" do
    visit landscapes_url
    click_on "New Landscape"

    fill_in "User", with: @landscape.user_id
    click_on "Create Landscape"

    assert_text "Landscape was successfully created"
    click_on "Back"
  end

  test "updating a Landscape" do
    visit landscapes_url
    click_on "Edit", match: :first

    fill_in "User", with: @landscape.user_id
    click_on "Update Landscape"

    assert_text "Landscape was successfully updated"
    click_on "Back"
  end

  test "destroying a Landscape" do
    visit landscapes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Landscape was successfully destroyed"
  end
end
