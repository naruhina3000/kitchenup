require 'test_helper'

class KitchenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kitchen_index_url
    assert_response :success
  end

  test "should get show" do
    get kitchen_show_url
    assert_response :success
  end

  test "should get edit" do
    get kitchen_edit_url
    assert_response :success
  end

  test "should get update" do
    get kitchen_update_url
    assert_response :success
  end

  test "should get new" do
    get kitchen_new_url
    assert_response :success
  end

  test "should get create" do
    get kitchen_create_url
    assert_response :success
  end

  test "should get destroy" do
    get kitchen_destroy_url
    assert_response :success
  end

end
