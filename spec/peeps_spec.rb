require 'peeps'

describe Peeps do

  context '.all' do

    it 'insert peeps on the test database' do
      connection = PG.connect(dbname: 'chitter_2_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('venice is a unique city');")
      connection.exec("INSERT INTO peeps (peep) VALUES('facebook can be a bit time consuming');")
      connection.exec("INSERT INTO peeps (peep) VALUES('we are part of the nature');")

      # Peeps.add_peep('venice is a unique city')
      # Peeps.add_peep('facebook can be a bit time consuming')
      # Peeps.add_peep('we are part of the nature')

      peeps = Peeps.all

      expect(peeps).to include('venice is a unique city')
      expect(peeps).to include('facebook can be a bit time consuming')
      expect(peeps).to include('we are part of the nature')
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
