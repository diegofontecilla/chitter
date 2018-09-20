feature 'Adding peeps' do
  scenario 'user can add a new peep to the list' do
    visit('/')
    fill_in('comment', :with => 'I want to visit Budapest')
    click_button ('Submit')

    expect(page).to have_content 'I want to visit Budapest'
  end
end
