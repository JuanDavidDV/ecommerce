require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
  end

  test "should be valid with name" do
    assert @category.valid?
  end

  test "should be invalid without name" do
    @category.name = nil
    assert_not @category.valid?
  end
end
