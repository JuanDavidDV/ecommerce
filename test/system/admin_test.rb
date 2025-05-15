require "application_system_test_case"
class AdminTest < ApplicationSystemTestCase
  setup do
    @admin = admins(:one)
  end

  test "should login as an Admin" do
    visit new_admin_session_url
    fill_in "Email", with: @admin.email
    fill_in "Password", with: "Password"
    click_on "Log in"

    using_wait_time(10) do
      assert_text "Admin Mode"
    end
  end
end
