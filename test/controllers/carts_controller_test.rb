require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @cart = carts(:one)
    @user = users(:one)
  end

  test "should create new cart if none exists" do
    assert_difference("Cart.count", 1) do
      post cart_path, params: { product_id: @product.id }
    end
  end
end
