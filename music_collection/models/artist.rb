require('pg')
require_relative('../db/sql_runner.rb')
require_relative('albums.rb')

class Artist
  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES ($1) RETURNING *"
    values = [@name]
    artist = SqlRunner.run(sql, values)
    @id = artist[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run(sql, values)
    artists_as_objects = artists.map {|artist| Artist.new(artist)}
    return artists_as_objects
  end

  def albums()
      sql = "SELECT * FROM albums
      WHERE artist_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      albums = results.map {|album| Albums.new(album)}
      return albums
  end

  def update()
    db = PG.connect({
      dbname: 'music_collection',
      host: 'localhost'
      })
      sql = "UPDATE artists
      SET (name) = ($1)
      WHERE id = $2"
      values = [@name, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end

  def self.delete_all()
    sql = "DELETE FROM artists"
    values = []
    artists = SqlRunner.run(sql, values)
  end

end
