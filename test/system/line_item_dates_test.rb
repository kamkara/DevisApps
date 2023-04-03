require "application_system_test_case"

class LineItemDatesTest < ApplicationSystemTestCase
  setup do
    @line_item_date = line_item_dates(:one)
  end

  test "visiting the index" do
    visit line_item_dates_url
    assert_selector "h1", text: "Line item dates"
  end

  test "should create line item date" do
    visit line_item_dates_url
    click_on "New line item date"

    fill_in "Date", with: @line_item_date.date
    fill_in "Quote", with: @line_item_date.quote_id
    click_on "Create Line item date"

    assert_text "Line item date was successfully created"
    click_on "Back"
  end

  test "should update Line item date" do
    visit line_item_date_url(@line_item_date)
    click_on "Edit this line item date", match: :first

    fill_in "Date", with: @line_item_date.date
    fill_in "Quote", with: @line_item_date.quote_id
    click_on "Update Line item date"

    assert_text "Line item date was successfully updated"
    click_on "Back"
  end

  test "should destroy Line item date" do
    visit line_item_date_url(@line_item_date)
    click_on "Destroy this line item date", match: :first

    assert_text "Line item date was successfully destroyed"
  end
end
