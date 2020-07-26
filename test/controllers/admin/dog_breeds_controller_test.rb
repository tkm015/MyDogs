require 'test_helper'

class Admin::DogBreedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dog_breeds_index_url
    assert_response :success
  end

end
