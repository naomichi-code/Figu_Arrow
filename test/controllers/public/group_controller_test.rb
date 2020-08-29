require 'test_helper'

class Public::GroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_group_index_url
    assert_response :success
  end

end
