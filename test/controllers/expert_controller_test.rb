require 'test_helper'

class ExpertControllerTest < ActionController::TestCase
  test "should get show_personal_data" do
    get :show_personal_data
    assert_response :success
  end

  test "should get edit_personal_data" do
    get :edit_personal_data
    assert_response :success
  end

  test "should get update_personal_data" do
    get :update_personal_data
    assert_response :success
  end

end
