require "test_helper"

class CartTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @cart = carts(:one)
  end

  test "should be valid with user" do
    assert @cart.valid?
  end

  test "should be valid without user optional" do
    @cart.user = nil
    assert @cart.valid?
  end

  test "should set secret_id before create" do
    @cart.save!
    assert_not_nil @cart.secret_id
  end

  test "should have default status as pending" do
    @cart.save!
    assert_equal "pending", @cart.status
  end

  test "should allow to change the status to complete" do
    @cart.save!
    @cart.complete!
    assert_equal "complete", @cart.status
  end

  test "should destroy associated cart_items on destroy" do
    assert_difference("CartItem.count", -@cart.cart_items.count) do
      @cart.destroy
    end
  end

  test "should have many products through cart_items" do
    assert_respond_to @cart, :products
  end
end
