require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @cart = carts(:one)
    @user = users(:one)
  end

  test "should create cart and add product" do
    
  end

end
