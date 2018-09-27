feature 'a peep belongs to a user' do
  scenario 'a peep has tagged its user' do

    User.create('ro@fonte.com', '1234', 'roberto', 'roby')

    visit('/')
    fill_in('email', :with => 'ro@fonte.com')
    fill_in('password', :with => '1234')
    click_button 'Submit'
    visit('/make_a_post')
    fill_in('comment', :with => 'a year in italy!')
    click_button 'Submit'

    expect(page).to have_content 'a year in italy!'
  end
end
