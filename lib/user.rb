require 'sinatra/base'

class User

  attr_reader :id, :email, :password, :name, :username

  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email, password, name, username)
    result = database.exec("INSERT INTO user_account (email, password, name, username)
                              VALUES('#{email}', '#{password}', '#{name}', '#{username}')
                              RETURNING id, email, password, name, username;")
    return User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

  def self.find_id(email, password)
    result = database.exec("SELECT * FROM user_account WHERE email = '#{email}';")
    return nil unless result.any?
    return nil unless result[0]['password'] == password
    return result[0]['id']
  end

  def self.get_user_by_id(user_id)
    return nil unless user_id
    result = database.exec("SELECT * FROM user_account WHERE id = '#{user_id}';")
    return User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

  def self.all
    result = database.exec("SELECT * FROM user_account")
    result.map do |user|
      User.new(user['id'], user['email'], user['password'], user['name'], user['username'])
    end
  end

  def self.database
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_2_test' : 'chitter_2'
    @connection ||= PG.connect(dbname: db_name)
  end
end
