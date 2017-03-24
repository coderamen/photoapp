require 'test_helper'

class PicsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get pics index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :new
  end

  test "should get show" do
    get :show
    asser_response :show
  end
end
