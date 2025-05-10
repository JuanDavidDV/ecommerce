require "test_helper"

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = products(:one)
  end

  test "should be valid with name and price" do
    assert @product.valid?
  end

  test "should not be valid without a name" do
    @product.name = nil
    assert_not @product.valid?
  end

  test "should not be valid without a price" do
    @product.price = nil
    assert_not @product.valid?
  end

  test "should respond to category association" do
    assert_respond_to @product, :category
  end
end
