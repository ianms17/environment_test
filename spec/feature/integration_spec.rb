# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 18
    fill_in 'Published date', with: '1990-04-26'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid author' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    # fill_in 'Author', with: ''
    fill_in 'Price', with: 18
    fill_in 'Published date', with: '1990-04-26'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end

  scenario 'invalid price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    # fill_in 'Price', with: -1.75
    fill_in 'Published date', with: '1990-04-26'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end

  scenario 'invalid published date' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 18
    # fill_in 'Published date', with: '1999'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end
  
end