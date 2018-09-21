require 'peeps'

describe Peeps do

  context '.all' do

    it 'insert peeps on the test database' do
      connection = PG.connect(dbname: 'chitter_2_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('this is a great day');")
      connection.exec("INSERT INTO peeps (peep) VALUES('autumn starts next sunday');")
      connection.exec("INSERT INTO peeps (peep) VALUES('london is an amazing city');")

      peeps = Peeps.all

      expect(peeps).to include('having breakfast on venice')
      expect(peeps).to include('I dont see facebook much')
      expect(peeps).to include('I love nature')
    end
  end
end
