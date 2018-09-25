feature 'Sign up' do
  scenario 'A new user can sign up and see her name on the screen' do
    visit ('/')
    fill_in :email, with: 'mail@diegofontecilla.com'
    fill_in :password, with: 'totito'
    fill_in :name, with: 'Diego'
    fill_in :username, with: 'diegofontecilla'
    click_button 'Submit'
    expect(page).to have_content 'Hi Diego, share a post with your friends:'
  end
end
