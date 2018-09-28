require 'peeps'

describe Peeps do

  context '.all' do

    it 'inserts a new peep on the database' do
      Peeps.add_peep('venice is a really unique city', '42')
      exists_in_db = Peeps.all.any? { |peep| peep.text == 'venice is a really unique city' }
      expect(exists_in_db).to eq true
    end
  end

  context '.add_peep' do

    it 'prints a time stamp indicating the time when a new post was made' do
      allow(Time).to receive(:now).and_return('time')

      Peeps.add_peep('i leave in the present', '38')
      new_peep = Peeps.all.find { |peep| peep.text == 'i leave in the present' }
      expect(new_peep.timestamp).to eq 'time'
    end
  end
end
