require 'rails_helper'

describe 'Home page', js: true do
  let!(:user) { create :user, email: 'visitor@example.com', password: 'password' }
  let!(:post) { create :post, body: 'A post!', user: user }

  it 'loads the feed' do
    visit '/'
    expect(page).to have_content('Broadcast')
    expect(page).to have_content('Sign in')

    click_on 'Sign in'
    fill_in 'Email', with: 'visitor@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    expect(current_path).to eq root_path
    
    expect(page).to have_content('Incoming messages:') 

    within('.feed') do
      expect(page).to have_content('A post!')
    end
  end
end
