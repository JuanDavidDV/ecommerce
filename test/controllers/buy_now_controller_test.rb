require "test_helper"

class BuyNowController < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @user = users(:one)
  end
end
