require 'test_helper'

class BlokksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get blokks_new_url
    assert_response :success
  end

  test "should get edit" do
    get blokks_edit_url
    assert_response :success
  end

end
