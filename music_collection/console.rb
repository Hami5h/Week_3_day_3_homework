require('pry')
require_relative('models/artists.rb')
require_relative('models/albums.rb')


artist_1 = Artists.new(
  {'name' => 'Jackie',})

artist_2 = Artists.new(
    {'name' => 'Callum',})

artist_1.save()
artist_2.save()

album_1 = Albums.new(
  {'name' => 'Roar', 'genre' => 'Pop', 'artist_id' => artist_1.id()})

album_2 = Albums.new(
  {'name' => 'Coding', 'genre' => 'Rock', 'artist_id' => artist_2.id()})

album_1.save()
album_2.save()

        binding.pry
        nil
