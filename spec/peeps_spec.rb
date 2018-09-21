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

  context '.add_peep' do

    it 'generate a time stamp indicating the time when a new post was made' do
      fake_time = double('time')
      allow(Time).to receive(:now).and_return(fake_time)
      allow(fake_time).to receive(:strftime).and_return('12:09')
      
      connection = PG.connect(dbname: 'chitter_2_test')

      Peeps.add_peep('francisca')
      peeps = Peeps.all
      expect(peeps).to include('francisca || post made at 12:09')
    end
  end
end
