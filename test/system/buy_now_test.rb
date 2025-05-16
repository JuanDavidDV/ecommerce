require "application_system_test_case"

class BuyNowTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
    @user = users(:one)
  end
end
