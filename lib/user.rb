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
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    result = connection.exec("INSERT INTO user_account (email, password, name, username)
                              VALUES('#{email}', '#{password}', '#{name}', '#{username}')
                              RETURNING id, email, password, name, username;")
    return User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

  def self.find(email, password)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    result = connection.exec("SELECT * FROM user_account WHERE email = '#{email}';")
    if result.any? && result[0]['password'] == password
      result[0]['id']
    end
  end

  def self.get_user_by_id(user_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    result = connection.exec("SELECT * FROM user_account WHERE id = '#{user_id}';")

    return User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    result = connection.exec("SELECT * FROM user_account")
    result.map do |user|
      User.new(user['id'], user['email'], user['password'], user['name'], user['username'])
    end
  end
end
