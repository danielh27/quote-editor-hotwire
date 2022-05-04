require "application_system_test_case"

class ItemDatesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = quotes(:first)
    @item_date = item_dates(:today)

    visit quote_path(@quote)
  end

  test 'Creating a new item date' do
    assert_selector 'h1', text: 'First Quote'

    click_on 'New Date'
    assert_selector 'h1', text: 'First Quote'
    fill_in 'Date', with: Date.current + 1.day

    click_on 'Create date'
    assert_selector 'h1', text: 'First Quote'
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test 'Updating a item date' do
    assert_selector 'h1', text: 'First Quote'

    within id: dom_id(@item_date) do
      click_on 'Edit'
    end

    assert_selector 'h1', text: 'First Quote'
    fill_in 'Date', with: Date.current + 1.day
    click_on 'Update date'

    assert_selector 'h1', text: 'First Quote'
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test 'Destroy a item date' do
    assert_text I18n.l(Date.current, format: :long)

    accept_confirm do
      within id: dom_id(@item_date) do
        click_on 'Delete'
      end
    end

    assert_no_text I18n.l(Date.current, format: :long)

  end
end
