require 'test_helper'

class BusinessClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_class = business_classes(:one)
  end

  test "should get index" do
    get business_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_business_class_url
    assert_response :success
  end

  test "should create business_class" do
    assert_difference('BusinessClass.count') do
      post business_classes_url, params: { business_class: { aeroplane_id: @business_class.aeroplane_id, seats: @business_class.seats } }
    end

    assert_redirected_to business_class_url(BusinessClass.last)
  end

  test "should show business_class" do
    get business_class_url(@business_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_class_url(@business_class)
    assert_response :success
  end

  test "should update business_class" do
    patch business_class_url(@business_class), params: { business_class: { aeroplane_id: @business_class.aeroplane_id, seats: @business_class.seats } }
    assert_redirected_to business_class_url(@business_class)
  end

  test "should destroy business_class" do
    assert_difference('BusinessClass.count', -1) do
      delete business_class_url(@business_class)
    end

    assert_redirected_to business_classes_url
  end
end
