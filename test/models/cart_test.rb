require "test_helper"

class CartTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @cart = carts(:one)
  end

  test "should be valid with user" do
    assert @cart.valid?
  end

  test "should be valid without user optional" do
    @cart.user = nil
    assert @cart.valid?
  end
end
