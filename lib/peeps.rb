require 'pg'

class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |post| post['peep'] }
  end

  def self.add_peep(comment, user_id)
    get_time

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_2_test')
    else
      connection = PG.connect(dbname: 'chitter_2')
    end

    # connection.exec("INSERT INTO peeps (peep) VALUES('#{comment} || post made at #{@str_time}');")
    connection.exec("INSERT INTO peeps (peep, user_id, timestamp) VALUES ('#{comment}', #{user_id.to_i}, '#{Time.now}');")
  end
  private

  def self.get_time
    time = Time.now
    format_time(time)
  end

  def self.format_time(time)
    @str_time = time.strftime("%H:%M")
  end
end
