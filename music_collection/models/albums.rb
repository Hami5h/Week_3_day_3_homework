require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Albums
  attr_accessor :id, :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING *"
    values = [@name, @genre, @artist_id]
    album = SqlRunner.run(sql, values)
    @id = album[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run(sql, values)
    albums_as_objects = albums.map {|album| Albums.new(album)}
    return albums_as_objects
  end

  def artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    artist = Artist.new(artist_data)
    return artist
  end

  def update()
    sql = "UPDATE albums
    SET (name, genre, artist_id) =
    ($1, $2, $3) WHERE id = $4"
    values = [@name, @genre, @artist_id, @id]
    albums = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    albums = SqlRunner.run(sql, values)
  end

  def Albums.find(id)
      sql = "SELECT * FROM albums
      WHERE id = $1"
      values = [id]
      albums = SqlRunner.run(sql, values)
      albums_as_objects = albums.map{ |album| Albums.new(album)}
      return albums_as_objects[0]
  end

end
