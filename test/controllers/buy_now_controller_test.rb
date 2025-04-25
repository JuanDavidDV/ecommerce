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

  test "should handle product not found" do
    invalid_id = Product.maximum(:id).to_i + 1
    get product_buy_now_url(product_id: invalid_id)
    assert_response :not_found
  end
end
