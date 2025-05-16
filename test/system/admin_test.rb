require "application_system_test_case"

class AdminTest < ApplicationSystemTestCase
  setup do
    @admin = admins(:one)
  end

  def log_in_admin
    visit new_admin_session_url
    fill_in "Email", with: @admin.email
    fill_in "Password", with: "Password"
    click_on "Log in"
  end

  test "should login as an Admin" do
    log_in_admin
    using_wait_time(10) do
      assert_text "Admin Mode"
    end
  end

  test "should get show page" do
    log_in_admin
    click_on "Admin Mode"
    assert_selector "h1", text: "Welcome to Admin Mode!"
  end

  test "should sign out Admin" do
    log_in_admin
    click_on "Sign Out"
    assert_text "Signed out successfully."
  end
end
