require 'pg'

class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |post| post['peep'] }
  end

  def self.add_peep(comment)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{comment}');")
  end
end
