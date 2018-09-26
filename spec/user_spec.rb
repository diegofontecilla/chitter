require 'user'

describe User do

  it '.all returns a list of users' do
    User.create('manuel@garcha.com', '1234', 'manuel', 'manuelgarcha')
    User.create('jorge@garcha.com', '1234', 'jorge', 'jorgegarcha')
    User.create('cristobal@garcha.com', '1234', 'cristobal', 'cristobalgarcha')

    users = User.all
    user = User.all.last

    expect(user).to be_a User
    expect(user).to respond_to(:id)
    expect(user.name).to eq('cristobal')
    expect(user.email).to eq('cristobal@garcha.com')
  end

  context '.find' do
    it 'id of a user with its email and password' do
      user = User.create('mail@a.com', 'lavoro', 'diego', 'diegofontecilla')
      id = User.find('mail@a.com', 'lavoro')
      expect(user.id).to eq(id)
    end

    it 'prints an error if password does not match with email' do
      user = User.create('maida@marzolo.com', '1234', 'magdalena', 'maida')
      expect(User.find('maida@marzolo.com', '2222')).to eq(nil)
    end
  end

  it '.create a new user account' do
    user = User.create('bachan@garcha.com', '1234', 'bachan', 'bachangarcha')
    expect(user.email).to eq('bachan@garcha.com')
    expect(user.password).to eq('1234')
    expect(user.name).to eq('bachan')
    expect(user.username).to eq('bachangarcha')
  end
end
