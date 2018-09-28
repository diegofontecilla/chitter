require 'pg'

class Peeps
  attr_reader :id, :text, :timestamp, :user_id

  def initialize(details)
    @id = details['id']
    @text = details['peep']
    @timestamp = details['timestamp']
    @user_id = details['user_id']
  end

  def self.all
    self.connect_to_db
    result = @connection.exec("SELECT * FROM peeps")
    result.map { |peep_info| Peeps.new(peep_info) }
  end

  def self.add_peep(peep, user_id)
    self.connect_to_db
    @connection.exec("INSERT INTO peeps (peep, user_id, timestamp) VALUES ('#{peep}', #{user_id.to_i}, '#{Time.now}');")
  end

  def self.get_time_format
    self.connect_to_db
    result = @connection.exec("SELECT timestamp FROM peeps")
    result.map { |time| format_time(time) }
  end

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_2_test')
    else
      @connection = PG.connect(dbname: 'chitter_2')
    end
  end

  private

  def self.format_time(time)
    @str_time = time.strftime("%H:%M")
  end
end
