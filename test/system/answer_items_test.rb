require "application_system_test_case"

class AnswerItemsTest < ApplicationSystemTestCase
  setup do
    @answer_item = answer_items(:one)
  end

  test "visiting the index" do
    visit answer_items_url
    assert_selector "h1", text: "Answer Items"
  end

  test "creating a Answer item" do
    visit answer_items_url
    click_on "New Answer Item"

    check "Correct" if @answer_item.correct
    fill_in "Title", with: @answer_item.title
    click_on "Create Answer item"

    assert_text "Answer item was successfully created"
    click_on "Back"
  end

  test "updating a Answer item" do
    visit answer_items_url
    click_on "Edit", match: :first

    check "Correct" if @answer_item.correct
    fill_in "Title", with: @answer_item.title
    click_on "Update Answer item"

    assert_text "Answer item was successfully updated"
    click_on "Back"
  end

  test "destroying a Answer item" do
    visit answer_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answer item was successfully destroyed"
  end
end
