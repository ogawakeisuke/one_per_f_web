require 'test_helper'

class MainsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get parse" do
    get :parse
    assert_response :success
  end

end
