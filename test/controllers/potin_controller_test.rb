require "test_helper"

class PotinControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get potin_index_url
    assert_response :success
  end
end
