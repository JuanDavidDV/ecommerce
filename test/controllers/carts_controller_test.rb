require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @user = users(:one)
    @cart = Cart.create
    @cart.cart_items.create(product: @product)
    @empty_cart = Cart.create
  end

  test "should create a new cart when none exists" do
    assert_difference("Cart.count", 1) do
      post cart_url, params: { product_id: @product.id }
    end
  end
end
