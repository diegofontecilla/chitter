require 'user'

describe User do

  it 'creates a user' do
    connection = PG.connect(dbname: 'chitter_2_test')

    user = User
    user.create('mail@diegofontecilla.com', 'lavoro', 'diego', 'diegofontecilla')
    expect(user.find('mail@diegofontecilla.com', 'lavoro')).to eq(nil)
  end
end
