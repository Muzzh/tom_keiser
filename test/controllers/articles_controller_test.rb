require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_index_url
    assert_response :success
  end

  test "should get one" do
    get articles_one_url
    assert_response :success
  end

  test "should get two" do
    get articles_two_url
    assert_response :success
  end

end
