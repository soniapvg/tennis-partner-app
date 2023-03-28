require "test_helper"

class ParametersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parameters_index_url
    assert_response :success
  end
end
