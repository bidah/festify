require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    #assert_select "title", "Home | Ruby on Rails tutorial sample app"
  end

  test "should get about" do
    get :about
    assert_response :success
    #assert_select "title", "About | Ruby on Rails tutorial sample app"
  end

  test "should get contact" do
  	get :contact
  	assert_response :success
  	#assert_select "title", "Contact | Ruby on Rails tutorial sample app"
  end
end
