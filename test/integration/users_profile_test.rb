require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:ciri)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.collections.count.to_s, response.body
    assert_select 'div.pagination'
    @user.collections.paginate(page: 1).each do |collection|
      assert_match collection.title, response.body
    end
  end
end
