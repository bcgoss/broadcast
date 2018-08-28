require 'rails_helper'

describe 'Home page' do
  it 'loads the feed', js: true do
    visit '/'
    expect(page).to have_content('Broadcast')
    expect(page).to have_css('.feed')

    within('.feed') do
      expect(page).to have_css('.post')
    end
  end
end
