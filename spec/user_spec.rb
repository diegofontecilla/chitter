require 'user'

describe User do

  it '.all returns a list of users' do

    User.create('manuel@garcha.com', '1234', 'manuel', 'manuelgarcha')
    User.create('jorge@garcha.com', '1234', 'jorge', 'jorgegarcha')
    User.create('cristobal@garcha.com', '1234', 'cristobal', 'cristobalgarcha')

    users = User.all
    user = User.all.last

    expect(users.length).to eq 5
    expect(user).to be_a User
    expect(user).to respond_to(:id)
    expect(user.name).to eq('cristobal')
    expect(user.email).to eq('cristobal@garcha.com')
  end

  it '.find id of a user with its email and password' do

    user = User.create('mail@a.com', 'lavoro', 'diego', 'diegofontecilla')
    id = User.find('mail@a.com', 'lavoro')
    p 'd'
    p user
    p id
    expect(user.id).to eq(id)
  end
end
