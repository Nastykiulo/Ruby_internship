require "application_system_test_case"

class TestResultsTest < ApplicationSystemTestCase
  setup do
    @test_result = test_results(:one)
  end

  test "visiting the index" do
    visit test_results_url
    assert_selector "h1", text: "Test Results"
  end

  test "creating a Test result" do
    visit test_results_url
    click_on "New Test Result"

    fill_in "Assignment", with: @test_result.assignment_id
    check "Pass" if @test_result.pass
    click_on "Create Test result"

    assert_text "Test result was successfully created"
    click_on "Back"
  end

  test "updating a Test result" do
    visit test_results_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @test_result.assignment_id
    check "Pass" if @test_result.pass
    click_on "Update Test result"

    assert_text "Test result was successfully updated"
    click_on "Back"
  end

  test "destroying a Test result" do
    visit test_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test result was successfully destroyed"
  end
end
