require "test_helper"

class DevelopersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @developer = developers(:one)
  end

  test "should get index" do
    get developers_url, as: :json
    assert_response :success
  end

  test "should create developer" do
    assert_difference("Developer.count") do
      post developers_url, params: { developer: { username: @developer.username } }, as: :json
    end

    assert_response :created
  end

  test "should show developer" do
    get developer_url(@developer), as: :json
    assert_response :success
  end

  test "should update developer" do
    patch developer_url(@developer), params: { developer: { username: @developer.username } }, as: :json
    assert_response :success
  end

  test "should destroy developer" do
    assert_difference("Developer.count", -1) do
      delete developer_url(@developer), as: :json
    end

    assert_response :no_content
  end
end
