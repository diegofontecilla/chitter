require 'peeps'

describe Peeps do

  context '.all' do

    it 'inserts a new peep on the database' do
      Peeps.add_peep('venice is a really unique city')
      expect(Peeps.all[-1]).to include('venice is a really unique city')
    end
  end

  context '.add_peep' do

    it 'prints a time stamp indicating the time when a new post was made' do
      fake_time = double('time')
      allow(Time).to receive(:now).and_return(fake_time)
      allow(fake_time).to receive(:strftime).and_return('12:09')

      Peeps.add_peep('francisca')
      peeps = Peeps.all
      expect(peeps).to include('francisca || post made at 12:09')
    end
  end
end
