require 'test_helper'

class CollectionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:ciri)
    @other_user = users(:yennefer)
    @collection = collections(:witcher_collection)
    @fandom = fandoms(:witcher)
  end

  test "should redirect new when not logged in" do
    get new_collection_path
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Collection.count" do
      post collections_path, params: { collection: { title: "foo",
                                                    fandom: @fandom } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Collection.count" do
      delete collection_path(@collection)
    end
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_collection_path(@collection)
    assert_redirected_to login_url, "Shown edit collection form instead of redirect"
  end

  test "should redirect update when not logged in" do
    patch collection_path(@collection), params: { collection: { title: "bar" } }
    assert_redirected_to login_url
  end

  test "should redirect edit when not collection owner" do
    log_in_as(@other_user)
    get edit_collection_path(@collection)
    assert_redirected_to root_url
  end

  test "should redirect update when not collection owner" do
    log_in_as(@other_user)
    patch collection_path(@collection), params: { collection: { title: "bar" } }
    assert_redirected_to root_url
  end

  test "should redirect destroy when not collection owner" do
    log_in_as(@other_user)
    assert_no_difference "Collection.count" do
      delete collection_path(@collection)
    end
    assert_redirected_to root_url
  end
end
