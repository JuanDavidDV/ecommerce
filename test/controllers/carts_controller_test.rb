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

  test "should set session current_cart_id after creating a cart" do
    post cart_path, params: { product_id: @product.id }
    assert_not_nil session[:current_cart_id]
  end

  test "should add product to newly created cart" do
    post cart_path, params: { product_id: @product.id }
    cart = Cart.find_by(secret_id: session[:current_cart_id])
    assert_equal @product.id, cart.cart_items.last.product_id
  end

  test "should add product to existing cart" do
    post cart_path(product_id: @product.id) # Simulates post request to create a cart and set the session
    assert_difference("CartItem.count", 1) do
      post cart_path(product_id: @product.id)
    end
  end

  test "should redirect to checkout if cart is empty" do
    post cart_path(product_id: @product.id) # Simulates post request to create a cart and set the session
    CartItem.delete_all
    get checkout_cart_path
    assert_redirected_to root_path
  end

  test "should show flash message when cart is empty on checkout" do
    post cart_path(product_id: @product.id) # Simulates post request to create a cart and set the session
    CartItem.delete_all
    get checkout_cart_path
    assert_equal "You don't have any items in your cart yet!", flash[:notice]
  end
end
