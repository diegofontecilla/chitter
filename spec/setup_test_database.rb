require 'pg'

connection = PG.connect(dbname: 'chitter_2_test')

connection.exec("TRUNCATE peeps;")
