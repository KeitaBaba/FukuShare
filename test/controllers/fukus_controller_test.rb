require 'test_helper'

class FukusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fukus_index_url
    assert_response :success
  end

  test "should get show" do
    get fukus_show_url
    assert_response :success
  end

  test "should get new" do
    get fukus_new_url
    assert_response :success
  end

  test "should get edit" do
    get fukus_edit_url
    assert_response :success
  end

end
