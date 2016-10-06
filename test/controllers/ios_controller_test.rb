require 'test_helper'

class IosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @io = ios(:one)
  end

  test "should get index" do
    get ios_url
    assert_response :success
  end

  test "should get new" do
    get new_io_url
    assert_response :success
  end

  test "should create io" do
    assert_difference('Io.count') do
      post ios_url, params: { io: {  } }
    end

    assert_redirected_to io_url(Io.last)
  end

  test "should show io" do
    get io_url(@io)
    assert_response :success
  end

  test "should get edit" do
    get edit_io_url(@io)
    assert_response :success
  end

  test "should update io" do
    patch io_url(@io), params: { io: {  } }
    assert_redirected_to io_url(@io)
  end

  test "should destroy io" do
    assert_difference('Io.count', -1) do
      delete io_url(@io)
    end

    assert_redirected_to ios_url
  end
end
