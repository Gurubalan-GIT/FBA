require "application_system_test_case"

class BusinessClassesTest < ApplicationSystemTestCase
  setup do
    @business_class = business_classes(:one)
  end

  test "visiting the index" do
    visit business_classes_url
    assert_selector "h1", text: "Business Classes"
  end

  test "creating a Business class" do
    visit business_classes_url
    click_on "New Business Class"

    fill_in "Aeroplane", with: @business_class.aeroplane_id
    fill_in "Seats", with: @business_class.seats
    click_on "Create Business class"

    assert_text "Business class was successfully created"
    click_on "Back"
  end

  test "updating a Business class" do
    visit business_classes_url
    click_on "Edit", match: :first

    fill_in "Aeroplane", with: @business_class.aeroplane_id
    fill_in "Seats", with: @business_class.seats
    click_on "Update Business class"

    assert_text "Business class was successfully updated"
    click_on "Back"
  end

  test "destroying a Business class" do
    visit business_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business class was successfully destroyed"
  end
end
