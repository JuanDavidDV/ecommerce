require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @product_one = products(:one)
    @product_two = products(:two)
    @product_three = products(:three)
    @cart = carts(:one)
    @user = users(:one)
  end

  test "should add one product to a cart" do
    visit product_url(@product_one)
    click_on "Add To Cart"
    assert_selector "div.bg-white.border.border-black", text: "1", wait: 5
  end

  test "should add multiple products to a cart" do
    visit product_url(@product_one)
    click_on "Add To Cart"
    visit product_url(@product_two)
    click_on "Add To Cart"
    visit product_url(@product_three)
    click_on "Add To Cart"
    assert_selector "div.bg-white.border.border-black", text: "3", wait: 5
  end

  test "should not allow to checkout if cart is empty" do
    visit cart_url
    assert_text "You don't have any itmes in your car yet. To checkout please first add items."
  end

  test "should show products in the cart" do
    visit product_url(@product_one)
    click_on "Add To Cart"
    visit product_url(@product_two)
    click_on "Add To Cart"
    visit cart_url
    assert_text "You have 2 items in your cart"
  end

  test "should remove item from cart" do
    visit product_url(@product_one)
    click_on "Add To Cart"
    visit root_url
    visit cart_url
    click_on "Remove From Cart"
    assert_text "You don't have any itmes in your car yet. To checkout please first add items."
  end

  test "should go to checkout page" do
    visit product_url(@product_one)
    click_on "Add To Cart"
    visit root_url
    visit checkout_cart_url
    assert_selector "h1", text: "Your Cart"
  end

  test "should go to the success page" do
    visit product_url(@product_one)
    click_on "Add To Cart"
    visit root_url
  end
end
