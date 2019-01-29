require 'rails_helper'

describe 'Home page', js: true do
  let!(:post) { create :post, body: 'A post!' }

  it 'loads the feed' do
    visit '/'
    expect(page).to have_content('Broadcast')
    expect(page).to have_content('Incoming messages:') 

    within('.feed') do
      expect(page).to have_content('A post!')
    end
  end
end
