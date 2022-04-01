require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  test 'Creating a new quote' do
    # When whe visit the Quotes#index page
    # we expect to see a h1 title with the text 'Quotes'
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    # When we click on the 'New Quote' button
    # we expect to land on a page with the title 'New Quote'
    click_on 'New Quote'
    assert_selector 'h1', text: 'New Quote'

    # When we fill in the name input with 'Testing name quote'
    # and we click on the 'Create quote' button
    # whe expect to land on a page with the text 'Quotes'
    # and to see the new quote added to the list
    fill_in 'Name', with: 'Testing name quote'
    click_on 'Create quote'
    assert_selector 'h1', text: 'Quotes'
    assert_text 'Testing name quote'
  end
end
