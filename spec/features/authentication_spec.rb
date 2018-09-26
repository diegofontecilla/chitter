feature 'authentication' do
  it 'a user can sign in' do
    User.create('feli@fonte.com', '1234', 'felipe', 'feli')

    visit('/')
    fill_in('email', :with => 'feli@fonte.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'

    expect(page).to have_content 'Hi felipe, share a post with your friends:'
  end
end
