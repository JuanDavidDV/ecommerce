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
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: @category.name } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: @category.name } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
