require 'test_helper'

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get gossip" do
    get dynamic_pages_gossip_url
    assert_response :success
  end

end
