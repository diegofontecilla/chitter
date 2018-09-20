feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_2_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'having breakfast on venice');")
    connection.exec("INSERT INTO peeps VALUES(2, 'I dont see facebook much');")
    connection.exec("INSERT INTO peeps VALUES(3, 'I love nature');")

    visit('/')

    expect(page).to have_content 'having breakfast on venice'
    expect(page).to have_content 'I dont see facebook much'
    expect(page).to have_content 'I love nature'
  end
end
