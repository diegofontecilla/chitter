# feature 'User sign up' do
#   scenario 'get error when submit invalid email' do
#     visit ('/')
#     fill_in :email, with: 'mailfontana.com'
#     fill_in :password, with: '1234'
#     fill_in :name, with: 'fonsi'
#     fill_in :username, with: 'fonsi'
#     click_button 'Submit'
#     expect(page).not_to have_content('Welcome to Chitter')
#     expect(page).to have_content('You must submit a valid email address')
#   end
# end
