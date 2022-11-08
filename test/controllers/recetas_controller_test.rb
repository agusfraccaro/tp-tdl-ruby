require "test_helper"

class RecetasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recetas_new_url
    assert_response :success
  end

  test "should get edit" do
    get recetas_edit_url
    assert_response :success
  end
end
