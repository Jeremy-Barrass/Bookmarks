require 'spec_helper'

feature 'tagging a link' do
  scenario 'The user adds a tag to a bookmark.' do
    visit '/link/add-new'
    fill_in 'bookmark_name', with: 'Favourite title'
    fill_in 'url', with: 'www.weeee!.co.uk'
    fill_in 'tag', with: 'Orcs!; 
    click_button 'create link'
    link = Link.first
    within 'ul#link' do
      expect(page).to have_content('bookmark name')
  end
end
