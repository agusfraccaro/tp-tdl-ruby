require "test_helper"

class CookpediaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cookpedia_index_url
    assert_response :success
  end
end
