class User

  def self.create(email, password, name, username)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    connection.exec("INSERT INTO user_account (email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}');")
  end

  def self.find(email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    result = connection.exec("SELECT email FROM user_account WHERE email = '#{email}';")
    if result.any? && result[0]['password'] == password
      result['id']
    end
  end
end
