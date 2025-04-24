require "test_helper"

class BuyNowControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @user = users(:one)
  end

  test "should get show" do
    get product_buy_now_url(@product)
    assert_equal "Soccer", @product.name
  end
end
