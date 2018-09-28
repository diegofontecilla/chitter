feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')
    fill_in('email', :with => 'carlo@fonte.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'
    fill_in('peep', :with => 'having breakfast on venice')
    click_button 'Submit'
    expect(page).to have_content 'having breakfast on venice'
  end
end
