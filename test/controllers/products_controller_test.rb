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
end
