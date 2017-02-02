require 'test_helper'

class MatchControllerTest < ActionController::TestCase
  test "should get set" do
    get :set
    assert_response :success
  end

end
