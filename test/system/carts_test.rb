require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
    @cart = carts(:one)
    @user = users(:one)
  end

  test "should add one product to a cart" do
    visit product_url(@product)
    using_wait_time(10) do
      click_on "Add To Cart"
    end

    assert_selector "div.bg-white.border.border-black", text: "1", wait: 5
  end
end
