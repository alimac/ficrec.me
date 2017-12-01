require 'test_helper'

class FandomsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:tissaia)
    @non_admin = users(:yennefer)
    @fandom = fandoms(:witcher)
  end

  test "should redirect new when not logged in or not admin" do
    get new_fandom_path
    assert_redirected_to login_url

    log_in_as(@non_admin)
    get new_fandom_path
    assert_redirected_to root_url
  end

  test "should redirect create when not logged in or not admin" do
    assert_no_difference "Fandom.count" do
      post fandoms_path, params: { fandom: { name: "foo" } }
    end
    assert_redirected_to login_url

    log_in_as(@non_admin)
    assert_no_difference "Fandom.count" do
      post fandoms_path, params: { fandom: { name: "foo" } }
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in or not admin" do
    assert_no_difference "Fandom.count" do
      delete fandom_path(@fandom)
    end
    assert_redirected_to login_url

    log_in_as(@non_admin)
    assert_no_difference "Fandom.count" do
      delete fandom_path(@fandom)
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in or not admin" do
    get edit_fandom_path(@fandom)
    assert_redirected_to login_url, "Shown edit fandom form instead of redirect"

    log_in_as(@non_admin)
    get edit_fandom_path(@fandom)
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in or not admin" do
    patch fandom_path(@fandom), params: { fandom: { name: "foo" } }
    assert_redirected_to login_url

    log_in_as(@non_admin)
    patch fandom_path(@fandom), params: { fandom: { name: "foo" } }
    assert_redirected_to root_url
  end

end
