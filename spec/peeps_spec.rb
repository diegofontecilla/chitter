require 'peeps'

describe Peeps do

  context '.all' do

    it 'display all the peeps' do
      connection = PG.connect(dbname: 'chitter_2_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('having breakfast on venice');")
      connection.exec("INSERT INTO peeps (peep) VALUES('I dont see facebook much');")
      connection.exec("INSERT INTO peeps (peep) VALUES('I love nature');")

      peeps = Peeps.all

      expect(peeps).to include('having breakfast on venice')
      expect(peeps).to include('I dont see facebook much')
      expect(peeps).to include('I love nature')
    end
  end
end
