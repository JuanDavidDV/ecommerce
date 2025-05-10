require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
  end

  test "should be valid with name" do
    assert @category.valid?
  end
end
