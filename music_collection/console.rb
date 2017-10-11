require('pry')
require_relative('models/artist.rb')
require_relative('models/albums.rb')

Albums.delete_all
Artist.delete_all

artist_1 = Artist.new(
  {'name' => 'Jackie',})

artist_2 = Artist.new(
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
