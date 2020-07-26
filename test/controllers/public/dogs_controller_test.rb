require 'test_helper'

class Public::DogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_dogs_new_url
    assert_response :success
  end

  test "should get create" do
    get public_dogs_create_url
    assert_response :success
  end

  test "should get show" do
    get public_dogs_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_dogs_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_dogs_update_url
    assert_response :success
  end

  test "should get detsroy" do
    get public_dogs_detsroy_url
    assert_response :success
  end

end
