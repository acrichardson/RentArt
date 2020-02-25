require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get products_name_url
    assert_response :success
  end

  test "should get details" do
    get products_details_url
    assert_response :success
  end

end
