require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get notifications_show_url
    assert_response :success
  end

end
