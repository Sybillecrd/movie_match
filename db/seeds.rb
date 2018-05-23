puts "Starting seed"

Opinion.destroy_all
User.destroy_all
Movie.destroy_all
Genre.destroy_all

@genres = [
  {
    "tmdb_id": 28,
    "name": "Action",
    "picture": "cinema-clapperboard.svg"
  },
  {
    "tmdb_id": 12,
    "name": "Adventure",
    "picture": "earth-globe.png"
  },
  {
    "tmdb_id": 16,
    "name": "Animation",
    "picture": "princess-face.png"
  },
  {
    "tmdb_id": 35,
    "name": "Comedy",
    "picture": "theatre-masks.png"
  },
  {
    "tmdb_id": 80,
    "name": "Crime",
    "picture": "fingerprint.png"
  },
  {
    "tmdb_id": 99,
    "name": "Documentary",
    "picture": "leaf.png"
  },
  {
    "tmdb_id": 18,
    "name": "Drama",
    "picture": "drop.png"
  },
  {
    "tmdb_id": 10751,
    "name": "Family",
    "picture": "kids-couple.png"
  },
  {
    "tmdb_id": 14,
    "name": "Fantasy",
    "picture": "japanese-dragon.png"
  },
  {
    "tmdb_id": 36,
    "name": "History",
    "picture": "sword.png"
  },
  {
    "tmdb_id": 27,
    "name": "Horror",
    "picture": "human-skull"
  },
  {
    "tmdb_id": 10402,
    "name": "Music",
    "picture": "music-player.png"
  },
  {
    "tmdb_id": 9648,
    "name": "Mystery",
    "picture": "halloween-ghost.png"
  },
  {
    "tmdb_id": 10749,
    "name": "Romance",
    "picture": "like.png"
  },
  {
    "tmdb_id": 878,
    "name": "Science Fiction",
    "picture": "outer-space-alien.png"
  },
  {
    "tmdb_id": 10770,
    "name": "TV Movie",
    "picture": "television.png"
  },
  {
    "tmdb_id": 53,
    "name": "Thriller",
    "picture": "pipe.png"
  },
  {
    "tmdb_id": 10752,
    "name": "War",
    "picture": "gun.png"
  },
  {
    "tmdb_id": 37,
    "name": "Western",
    "picture": "sheriff-badge.png"
  }
]

sybille = User.create!(first_name: "Sybille", last_name: "Cordeau", password: "secret", address: "Bordeaux", email: "sybille@movie.com")
romain = User.create!(first_name: "Bruce", last_name: "Wayne", password: "secret", address: "Bordeaux", email: "batman@gotham.com")
fight_club = Movie.create!(tmdb_id: 550, title: "Fight Club", poster:"https://images-na.ssl-images-amazon.com/images/I/81D%2BKJkO4SL._SL1500_.jpg", release_date: "11-10-1999")
aliens = Movie.create!(tmdb_id: 679, title: "Aliens", poster: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/hCFMlY8C3tDsh173C8NhOpf0pEK.jpg", release_date: "13-03-1986")
the_thin_red_line = Movie.create!(tmdb_id: 8741, title: "The thin red line", poster: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/jO9z0ojZHo15MmC4fU55jaogCiI.jpg", release_date: "13-03-1998")
master_and_commander = Movie.create!(tmdb_id: 8619, title: "Master and commander", poster: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/zY8UUNCaxIPes2LgnP4wdrQWDkB.jpg", release_date: "13-032003")
Opinion.create!(movie_id: fight_club.id, user_id: sybille.id, value: true)
Opinion.create!(movie_id: aliens.id, user_id: romain.id, value: true)
Opinion.create!(movie_id: fight_club.id, user_id: romain.id, value: true)
Opinion.create!(movie_id: the_thin_red_line.id, user_id: romain.id, value: true)
Opinion.create!(movie_id: master_and_commander.id, user_id: romain.id, value: true)

@genres.each do |genre|
  Genre.create!(tmdb_id: genre[:tmdb_id], name: genre[:name], picture: genre[:picture])
end

puts "Finished"
