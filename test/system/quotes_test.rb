require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = quotes(:first)
  end

  test 'Creating a new quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'New quote'
    fill_in 'Name', with: 'Testing name quote'

    assert_selector 'h1', text: 'Quotes'
    click_on 'Create quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Testing name quote'
  end

  test 'Showing a quote' do
    visit quotes_path
    click_link @quote.name
    assert_selector 'h1', text: @quote.name
  end

  test 'Updating a quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_link 'Edit', match: :first
    fill_in 'Name', with: 'Updated first quote'

    assert_selector 'h1', text: 'Quotes'
    click_on 'Update quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Updated first quote'
  end

  test 'Destroying a quote' do
    visit quotes_path
    assert_text @quote.name

    click_on 'Delete', match: :first
    assert_no_text @quote.name
  end
end
