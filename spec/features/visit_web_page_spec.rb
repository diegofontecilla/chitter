feature 'A user' do
  scenario 'can visit the chitter web page' do
    visit ('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
