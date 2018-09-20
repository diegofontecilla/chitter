require 'peeps'

describe Peeps do

  context '.all' do

    it 'display all the peeps' do
      peeps = Peeps.all
      expect(peeps).to match_array(['having breakfast on venice', 'I dont like facebook'])
    end

    # it 'display all the peeps' do
    #   peeps = Peeps.all

    #   # connection = PG.connect(dbname: 'chitter_2_test')
    #   #
    #   # connection.exec("INSERT INTO peeps (peep) VALUES ('having breakfast on venice');")
    #   #
    #   # peeps = Peeps.all
    #   #
    #   # expect(peeps).to include('having breakfast on venice')
    # end
  end
end
