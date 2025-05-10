require "test_helper"

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = products(:one)
  end

  test "should be valid with name and price" do
    assert @product.valid?
  end
end
