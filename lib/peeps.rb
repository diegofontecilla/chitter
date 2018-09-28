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
    result = database.exec("SELECT * FROM peeps")
    result.map { |peep_info| Peeps.new(peep_info) }
  end

  def self.add_peep(peep, user_id)
    time = Time.now.strftime("%H:%M %d/%m/%y")
    database.exec("INSERT INTO peeps (peep, user_id, timestamp) VALUES ('#{peep}', #{user_id.to_i}, '#{time}');")
  end

  def self.get_time_format
    result = database.exec("SELECT timestamp FROM peeps")
    result.map { |time| format_time(time) }
  end

  def self.database
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_2_test' : 'chitter_2'
    @connection ||= PG.connect(dbname: db_name)
  end
end
