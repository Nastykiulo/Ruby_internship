require 'test_helper'

class TestResultItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_result_item = test_result_items(:one)
  end

  test "should get index" do
    get test_result_items_url
    assert_response :success
  end

  test "should get new" do
    get new_test_result_item_url
    assert_response :success
  end

  test "should create test_result_item" do
    assert_difference('TestResultItem.count') do
      post test_result_items_url, params: { test_result_item: { question: @test_result_item.question, student_answer_id: @test_result_item.student_answer_id, test_result_id: @test_result_item.test_result_id } }
    end

    assert_redirected_to test_result_item_url(TestResultItem.last)
  end

  test "should show test_result_item" do
    get test_result_item_url(@test_result_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_result_item_url(@test_result_item)
    assert_response :success
  end

  test "should update test_result_item" do
    patch test_result_item_url(@test_result_item), params: { test_result_item: { question: @test_result_item.question, student_answer_id: @test_result_item.student_answer_id, test_result_id: @test_result_item.test_result_id } }
    assert_redirected_to test_result_item_url(@test_result_item)
  end

  test "should destroy test_result_item" do
    assert_difference('TestResultItem.count', -1) do
      delete test_result_item_url(@test_result_item)
    end

    assert_redirected_to test_result_items_url
  end
end
