feature 'A user' do
  scenario 'can visit the chitter web page' do
    visit ('/')
    fill_in :email, with: 'mail@diegofontecilla.com'
    fill_in :password, with: 'totito'
    fill_in :name, with: 'Diego'
    fill_in :user_name, with: 'diegofontecilla'
    click_button 'Submit'
    visit('/chitter')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
