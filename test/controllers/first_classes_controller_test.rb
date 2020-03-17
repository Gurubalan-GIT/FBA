require 'test_helper'

class FirstClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_class = first_classes(:one)
  end

  test "should get index" do
    get first_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_first_class_url
    assert_response :success
  end

  test "should create first_class" do
    assert_difference('FirstClass.count') do
      post first_classes_url, params: { first_class: { aeroplane_id: @first_class.aeroplane_id, seats: @first_class.seats } }
    end

    assert_redirected_to first_class_url(FirstClass.last)
  end

  test "should show first_class" do
    get first_class_url(@first_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_first_class_url(@first_class)
    assert_response :success
  end

  test "should update first_class" do
    patch first_class_url(@first_class), params: { first_class: { aeroplane_id: @first_class.aeroplane_id, seats: @first_class.seats } }
    assert_redirected_to first_class_url(@first_class)
  end

  test "should destroy first_class" do
    assert_difference('FirstClass.count', -1) do
      delete first_class_url(@first_class)
    end

    assert_redirected_to first_classes_url
  end
end
