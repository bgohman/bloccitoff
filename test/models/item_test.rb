require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @user = users(:bradley)
    @item = @user.items.build(name: "Lorem ipsum")
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "user id should be present" do
    @item.user_id = nil
    assert_not @item.valid?
  end

  test "content should be present" do
    @item.name = "   "
    assert_not @item.valid?
  end

  test "order should be oldest first to most recent last" do
    assert_equal items(:newest), Item.last
    assert_equal items(:oldest), Item.first
  end    
end
