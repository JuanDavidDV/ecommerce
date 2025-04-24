require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:one)
    sign_in @admin
  end

  test "should get admin dashboard" do
    get admin_url
    assert_response :success
  end
end
