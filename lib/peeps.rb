require 'pg'

class Peeps

  def self.all
    @peeps = ['having breakfast on venice',
              'I dont like facebook']
  end

  # def self.all
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'chitter_2_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter_2')
  #   end
  #
  #   result = connection.exec("SELECT * FROM peeps")
  #   result.map { |post| post['peep'] }
  # end
end
