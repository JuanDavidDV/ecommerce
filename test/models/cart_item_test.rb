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

  test "should be invalid without cart" do
    @cart_item.cart = nil
    assert_not @cart_item.valid?
  end

  test "should be invalid without a product" do
    @cart_item.product = nil
    assert_not @cart_item.valid?
  end

  test "should belong to cart" do
    assert_equal @cart, @cart_item.cart
  end

  test "should belong to product" do
    assert_equal @product, @cart_item.product
  end
end
