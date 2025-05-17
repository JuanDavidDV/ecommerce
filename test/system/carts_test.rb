require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
    @cart = carts(:one)
    @user = users(:one)
  end
end
