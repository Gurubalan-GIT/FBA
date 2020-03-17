require "application_system_test_case"

class EconomyClassesTest < ApplicationSystemTestCase
  setup do
    @economy_class = economy_classes(:one)
  end

  test "visiting the index" do
    visit economy_classes_url
    assert_selector "h1", text: "Economy Classes"
  end

  test "creating a Economy class" do
    visit economy_classes_url
    click_on "New Economy Class"

    fill_in "Aeroplane", with: @economy_class.aeroplane_id
    fill_in "Seats", with: @economy_class.seats
    click_on "Create Economy class"

    assert_text "Economy class was successfully created"
    click_on "Back"
  end

  test "updating a Economy class" do
    visit economy_classes_url
    click_on "Edit", match: :first

    fill_in "Aeroplane", with: @economy_class.aeroplane_id
    fill_in "Seats", with: @economy_class.seats
    click_on "Update Economy class"

    assert_text "Economy class was successfully updated"
    click_on "Back"
  end

  test "destroying a Economy class" do
    visit economy_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Economy class was successfully destroyed"
  end
end
