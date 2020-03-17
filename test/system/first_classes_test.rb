require "application_system_test_case"

class FirstClassesTest < ApplicationSystemTestCase
  setup do
    @first_class = first_classes(:one)
  end

  test "visiting the index" do
    visit first_classes_url
    assert_selector "h1", text: "First Classes"
  end

  test "creating a First class" do
    visit first_classes_url
    click_on "New First Class"

    fill_in "Aeroplane", with: @first_class.aeroplane_id
    fill_in "Seats", with: @first_class.seats
    click_on "Create First class"

    assert_text "First class was successfully created"
    click_on "Back"
  end

  test "updating a First class" do
    visit first_classes_url
    click_on "Edit", match: :first

    fill_in "Aeroplane", with: @first_class.aeroplane_id
    fill_in "Seats", with: @first_class.seats
    click_on "Update First class"

    assert_text "First class was successfully updated"
    click_on "Back"
  end

  test "destroying a First class" do
    visit first_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "First class was successfully destroyed"
  end
end
