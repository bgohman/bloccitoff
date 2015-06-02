require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Blocitoff"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Blocitoff"
  end

end
