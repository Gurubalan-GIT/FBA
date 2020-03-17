require 'test_helper'

class EconomyClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @economy_class = economy_classes(:one)
  end

  test "should get index" do
    get economy_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_economy_class_url
    assert_response :success
  end

  test "should create economy_class" do
    assert_difference('EconomyClass.count') do
      post economy_classes_url, params: { economy_class: { aeroplane_id: @economy_class.aeroplane_id, seats: @economy_class.seats } }
    end

    assert_redirected_to economy_class_url(EconomyClass.last)
  end

  test "should show economy_class" do
    get economy_class_url(@economy_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_economy_class_url(@economy_class)
    assert_response :success
  end

  test "should update economy_class" do
    patch economy_class_url(@economy_class), params: { economy_class: { aeroplane_id: @economy_class.aeroplane_id, seats: @economy_class.seats } }
    assert_redirected_to economy_class_url(@economy_class)
  end

  test "should destroy economy_class" do
    assert_difference('EconomyClass.count', -1) do
      delete economy_class_url(@economy_class)
    end

    assert_redirected_to economy_classes_url
  end
end
