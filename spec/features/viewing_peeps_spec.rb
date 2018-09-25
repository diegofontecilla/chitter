feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    
    Peeps.add_peep('having breakfast on venice')
    Peeps.add_peep('I dont see facebook much')
    Peeps.add_peep('I love nature')

    visit('/')

    expect(page).to have_content 'having breakfast on venice'
    expect(page).to have_content 'I dont see facebook much'
    expect(page).to have_content 'I love nature'
  end
end
