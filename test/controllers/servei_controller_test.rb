require 'test_helper'

class ServeiControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
