require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Albums
  attr_reader :id, :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name)
    VALUES ($1) RETURNING *"
    values = [@name]
    album = SqlRunner.run(sql, values)
    @id = album[0]['id'].to_i()
  end

end
