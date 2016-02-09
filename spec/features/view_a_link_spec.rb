# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
require 'spec_helper'

feature 'Viewing links on the homepage' do
  scenario 'The user can see a list of links when the homepage loads' do
    visit '/'
    Link.create(url: 'http://www.google.co.uk', title: 'Google')
    # p pagße.body
    # save_and_open_page
    # expect(page).to have_xpath('http://www.google.co.uk')
    expect(page).to have_content('Google')
  end
end
