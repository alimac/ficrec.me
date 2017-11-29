require 'test_helper'

class CollectionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @collection = collections(:witcher_collection)
    @fandom = fandoms(:witcher)
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
end
