require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  test "should get print" do
    get :print
    assert_response :success
  end

end
