require "test_helper"

class CtasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ctask = ctasks(:one)
  end

  test "should get index" do
    get ctasks_url
    assert_response :success
  end

  test "should get new" do
    get new_ctask_url
    assert_response :success
  end

  test "should create ctask" do
    assert_difference("Ctask.count") do
      post ctasks_url, params: { ctask: { description: @ctask.description, title: @ctask.title } }
    end

    assert_redirected_to ctask_url(Ctask.last)
  end

  test "should show ctask" do
    get ctask_url(@ctask)
    assert_response :success
  end

  test "should get edit" do
    get edit_ctask_url(@ctask)
    assert_response :success
  end

  test "should update ctask" do
    patch ctask_url(@ctask), params: { ctask: { description: @ctask.description, title: @ctask.title } }
    assert_redirected_to ctask_url(@ctask)
  end

  test "should destroy ctask" do
    assert_difference("Ctask.count", -1) do
      delete ctask_url(@ctask)
    end

    assert_redirected_to ctasks_url
  end
end
