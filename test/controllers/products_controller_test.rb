require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def attach_multiple_test_images(category, filenames)
    category.images.attach(
      filenames.map do |image|
        {
          io: File.open(Rails.root.join("test/fixtures/files/images/#{image}")),
          filename: image,
          content_type: "image/jpg"
        }
      end
    )
  end

  setup do
    @product = products(:one)
    @admin = admins(:one)

    attach_multiple_test_images(@product, [ "people-tshirts.jpg", "red-tshirts.jpg", "single-tshirt.jpg" ])
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

  test "should create product" do
    sign_in @admin
    assert_difference("")
  end
end
