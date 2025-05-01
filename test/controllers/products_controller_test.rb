require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @admin = admins(:one)
  end

  test "should get index of the products" do
    get root_url
    assert_response :success
  end

  test "should show a product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get form to create a new product" do
    sign_in @admin
    get new_product_url
    assert_response :success
  end
end
