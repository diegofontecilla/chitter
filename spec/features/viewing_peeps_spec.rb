feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')

    expect(page).to have_content "having breakfast on venice"
  end
end
