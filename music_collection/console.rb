require('pry')
require_relative('models/artists.rb')



artist_1 = Artists.new(
  {'name' => 'Jackie',})

artist_1.save()

binding.pry
nil
