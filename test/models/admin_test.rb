require "test_helper"

class AdminTest < ActiveSupport::TestCase
  setup do
    @admin = admins(:one)
  end

  test "should be valid with appropiate attributes" do
    assert @admin.valid?
  end
end
