require "application_system_test_case"

class CtasksTest < ApplicationSystemTestCase
  setup do
    @ctask = ctasks(:one)
  end

  test "visiting the index" do
    visit ctasks_url
    assert_selector "h1", text: "Ctasks"
  end

  test "should create ctask" do
    visit ctasks_url
    click_on "New ctask"

    fill_in "Description", with: @ctask.description
    fill_in "Title", with: @ctask.title
    click_on "Create Ctask"

    assert_text "Ctask was successfully created"
    click_on "Back"
  end

  test "should update Ctask" do
    visit ctask_url(@ctask)
    click_on "Edit this ctask", match: :first

    fill_in "Description", with: @ctask.description
    fill_in "Title", with: @ctask.title
    click_on "Update Ctask"

    assert_text "Ctask was successfully updated"
    click_on "Back"
  end

  test "should destroy Ctask" do
    visit ctask_url(@ctask)
    click_on "Destroy this ctask", match: :first

    assert_text "Ctask was successfully destroyed"
  end
end
