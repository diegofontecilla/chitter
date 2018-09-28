feature 'User sign up' do
  scenario 'get error when submit invalid email' do
    visit ('/')
    fill_in :email, with: 'maida@marzolo.com'
    fill_in :password, with: '1234'
    click_button 'Submit'
    expect(page).to have_content('Something does not match, please try again:')
  end
end
