require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def attach_multiple_test_images(category, filenames)  # Initialize a product with their images
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

  def attach_product_images(images) # Used for create and update images
    images.map do |image|
      fixture_file_upload("images/#{image}")
    end
  end

  setup do
    @product = products(:one)
    @category = categories(:one)
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
    assert_difference("Product.count", 1) do
      post products_url, params: {
        product: {
          name: @product.name,
          description: "Test Test Test 123",
          images: attach_product_images([ "people-tshirts.jpg", "red-tshirts.jpg", "single-tshirt.jpg" ]),
          price: 25,
          category_id: @category.id
        }
      }
    end
  end

  test "should redirect after product create" do
    sign_in @admin
    post products_url, params: {
      product: {
        name: @product.name,
        description: "Test Test Test 123",
        images: attach_product_images([ "people-tshirts.jpg", "red-tshirts.jpg", "single-tshirt.jpg" ]),
        price: 25,
        category_id: @category.id
      }
    }
    assert_redirected_to product_url(Product.last)
  end

  test "should get edit" do
    sign_in @admin
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    sign_in @admin
    patch product_url(@product), params: {
      product: {
         name: "Test Update",
         images: attach_product_images([ "people-tshirts.jpg", "red-tshirts.jpg", "single-tshirt.jpg" ]),
         price: 100
      }
    }
    assert_equal 100, @product.reload.price
  end

  test "should redirect after product update" do
    sign_in @admin
    patch product_url(@product), params: {
      product: {
        name: "Test Update",
        images: attach_product_images([ "people-tshirts.jpg", "red-tshirts.jpg", "single-tshirt.jpg" ]),
        price: 100
      }
    }

    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    sign_in @admin
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end
  end

  test "should redirect after destroy a product" do
    sign_in @admin
    delete product_url(@product)
    assert_redirected_to products_url
  end

  test "should get successfully CSV response" do
    sign_in @admin
    get export_csv_products_url(format: :csv)
    assert_response :success
  end

  test "should return CSV content type" do
    sign_in @admin
    get export_csv_products_url(format: :csv)
    assert_equal "text/csv", response.media_type
  end

  test "should include correct header in CSV export file" do
    sign_in @admin
    get export_csv_products_url(format: :csv)
    assert_equal "Name,Price $CAD,Category", response.body.lines.first.strip
  end

  test "should include product name in CSV file" do
    sign_in @admin
    get export_csv_products_url(format: :csv)
    assert_includes response.body, @product.name
  end

  test "should include product price in CSV file" do
    sign_in @admin
    get export_csv_products_url(format: :csv)
    assert_includes response.body, @product.price.to_s
  end

  test "should include category name in CSV file" do
    sign_in @admin
    get export_csv_products_url(format: :csv)
    assert_includes response.body, @category.name
  end
end
