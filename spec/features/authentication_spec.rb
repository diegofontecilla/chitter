feature 'authentication' do

  it 'a user can sign in' do
    User.create('feli@fonte.com', '1234', 'felipe', 'feli')
    visit('/')
    fill_in('email', :with => 'feli@fonte.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'
    expect(page).to have_content 'Hi felipe, share a post with your friends:'
  end

  it 'an error is printed when password doesnt match with email' do
    visit('/')
    fill_in('email', :with => 'dani@bortnik.com')
    fill_in('password', :with => 'wrongpassword')
    click_button 'Submit'

    expect(page).not_to have_content 'Hi dani, share a post with your friends:'
    expect(page).to have_content 'Something does not match, please try again:'
  end

  it 'an error is printed when email is wrong' do
    visit('/')
    fill_in('email', :with => 'dani@bortnikkkkk.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'

    expect(page).not_to have_content 'Hi dani, share a post with your friends:'
    expect(page).to have_content 'Something does not match, please try again:'
  end

  it 'user can sign out' do
    visit('/')
    fill_in('email', :with => 'feli@fonte.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'
    click_button 'Sign out'
    expect(page).to have_content 'You have signed out'
  end
end
