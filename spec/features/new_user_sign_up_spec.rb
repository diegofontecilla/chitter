feature 'Sign up' do
  scenario 'A new user can sign up and see her name on the screen' do
    User.create('mail@diegogarcia.com', '1234', 'diego', 'diegogarcia')
    visit ('/')
    click_button 'Sign up'
    fill_in :email, with: 'mail@diegogarcia.com'
    fill_in :password, with: '1234'
    fill_in :name, with: 'diego'
    fill_in :username, with: 'diegogarcia'
    click_button 'Submit'
    expect(page).to have_content 'Hi diego, share a post with your friends:'
  end
end
