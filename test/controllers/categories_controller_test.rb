require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @admin = admins(:one)
  end

  test "should get index of categories" do
    get categories_url
    assert_response :success
  end

  test "should show a category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get new category form" do
    sign_in @admin
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in @admin
    assert_difference("Category.count", 1) do
      post categories_url, params: { category: { name: @category.name } }
    end
  end

  test "should redirect after category create" do
    sign_in @admin
    post categories_url, params: { category: { name: @category.name } }
    assert_redirected_to category_url(Category.last)
  end

  test "should get edit" do
    sign_in @admin
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    sign_in @admin
    patch category_url(@category), params: { category: { name: "Updated Test" } }
    assert_equal "Updated Test", @category.reload.name
  end

  test "should redirect after category update" do
    sign_in @admin
    patch category_url(@category), params: { category: { name: "Updated Test" } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    sign_in @admin
    @category.products.destroy_all
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end
  end

  test "should redirect after destroy a category" do
    sign_in @admin
    @category.products.destroy_all
    delete category_url(@category)
    assert_redirected_to categories_url
  end
end
