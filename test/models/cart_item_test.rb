require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  setup do
    @cart = carts(:one)
    @product = products(:one)
    @cart_item = cart_items(:one)
  end

  test "should be valid with valid cart and product" do
    assert @cart_item.valid?
  end
end
