require 'test_helper'

class AnswerItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_item = answer_items(:one)
  end

  test "should get index" do
    get answer_items_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_item_url
    assert_response :success
  end

  test "should create answer_item" do
    assert_difference('AnswerItem.count') do
      post answer_items_url, params: { answer_item: { correct: @answer_item.correct, title: @answer_item.title } }
    end

    assert_redirected_to answer_item_url(AnswerItem.last)
  end

  test "should show answer_item" do
    get answer_item_url(@answer_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_item_url(@answer_item)
    assert_response :success
  end

  test "should update answer_item" do
    patch answer_item_url(@answer_item), params: { answer_item: { correct: @answer_item.correct, title: @answer_item.title } }
    assert_redirected_to answer_item_url(@answer_item)
  end

  test "should destroy answer_item" do
    assert_difference('AnswerItem.count', -1) do
      delete answer_item_url(@answer_item)
    end

    assert_redirected_to answer_items_url
  end
end
