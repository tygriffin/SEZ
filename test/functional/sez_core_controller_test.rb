require 'test_helper'

class SezCoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get archive" do
    get :archive
    assert_response :success
  end

  test "should get contribute" do
    get :contribute
    assert_response :success
  end

  test "should get blog" do
    get :blog
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
