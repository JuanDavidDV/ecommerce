require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @user = users(:one)
    @cart = Cart.create
    @cart.cart_items.create(product: @product)
    @empty_cart = Cart.create
  end


end
