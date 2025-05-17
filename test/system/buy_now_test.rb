require "application_system_test_case"

class BuyNowTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
    @user = users(:one)
  end

  test "should get show page" do
    visit product_buy_now_url(@product)
    using_wait_time(10) do
      assert_text "Soccer"
    end
  end

  test "should get success page" do
    visit success_product_buy_now_url(@product)
    using_wait_time(10) do
      assert_text "Purchase has been successfully completed"
    end
  end
end
