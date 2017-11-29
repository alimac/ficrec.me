require 'test_helper'

class CollectionTest < ActiveSupport::TestCase

  def setup
    @user = users(:ciri)
    @fandom = fandoms(:witcher)
    @collection = @user.collections.build(title: "Lorem ipsum",
                                          fandom: @fandom)
  end

  test "should be valid" do
    assert @collection.valid?
  end

  test "user id should be present" do
    @collection.user_id = nil
    assert_not @collection.valid?
  end

  test "title should be present" do
    @collection.title = "      "
    assert_not @collection.valid?
  end

  test "title should be at most 250 characters" do
    @collection.title = "a" * 251
    assert_not @collection.valid?
  end
end
