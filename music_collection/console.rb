require('pry')
require_relative('models/artists.rb')
require_relative('models/albums.rb')


artist_1 = Artists.new(
  {'name' => 'Jackie',})

  artist_1.save()

album_1 = Albums.new(
  {'name' => 'Roar', 'genre' => 'Pop', 'artist_id' => artist_1.id()})

album_1.save()

  binding.pry
  nil
