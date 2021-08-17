require "application_system_test_case"

class TestResultItemsTest < ApplicationSystemTestCase
  setup do
    @test_result_item = test_result_items(:one)
  end

  test "visiting the index" do
    visit test_result_items_url
    assert_selector "h1", text: "Test Result Items"
  end

  test "creating a Test result item" do
    visit test_result_items_url
    click_on "New Test Result Item"

    fill_in "Question", with: @test_result_item.question
    fill_in "Student answer", with: @test_result_item.student_answer_id
    fill_in "Test result", with: @test_result_item.test_result_id
    click_on "Create Test result item"

    assert_text "Test result item was successfully created"
    click_on "Back"
  end

  test "updating a Test result item" do
    visit test_result_items_url
    click_on "Edit", match: :first

    fill_in "Question", with: @test_result_item.question
    fill_in "Student answer", with: @test_result_item.student_answer_id
    fill_in "Test result", with: @test_result_item.test_result_id
    click_on "Update Test result item"

    assert_text "Test result item was successfully updated"
    click_on "Back"
  end

  test "destroying a Test result item" do
    visit test_result_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test result item was successfully destroyed"
  end
end
