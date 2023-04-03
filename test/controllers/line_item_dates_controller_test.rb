require "test_helper"

class LineItemDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item_date = line_item_dates(:one)
  end

  test "should get index" do
    get line_item_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_date_url
    assert_response :success
  end

  test "should create line_item_date" do
    assert_difference("LineItemDate.count") do
      post line_item_dates_url, params: { line_item_date: { date: @line_item_date.date, quote_id: @line_item_date.quote_id } }
    end

    assert_redirected_to line_item_date_url(LineItemDate.last)
  end

  test "should show line_item_date" do
    get line_item_date_url(@line_item_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_date_url(@line_item_date)
    assert_response :success
  end

  test "should update line_item_date" do
    patch line_item_date_url(@line_item_date), params: { line_item_date: { date: @line_item_date.date, quote_id: @line_item_date.quote_id } }
    assert_redirected_to line_item_date_url(@line_item_date)
  end

  test "should destroy line_item_date" do
    assert_difference("LineItemDate.count", -1) do
      delete line_item_date_url(@line_item_date)
    end

    assert_redirected_to line_item_dates_url
  end
end
