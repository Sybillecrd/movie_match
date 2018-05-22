puts "Starting seed"

Opinion.destroy_all
User.destroy_all
Movie.destroy_all

@genres = [
  {
    "tmdb_id": 28,
    "name": "Action",
    "picture": "cinema-clapperboard.png"
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

User.create!(first_name: "Sybille", last_name: "Cordeau", address: "Bordeaux", email: "sybille@movie.com")
Movie.create!(tmdb_id: 550, title: "Fight Club", release_date: "11-10-1999")
Opinion.create!(movie_id: 1, user_id: 1, value: true)

@genres.each do |genre|
  Genre.create!(tmdb_id: genre[:tmdb_id], name: genre[:name], picture: genre[:picture])
end

puts "Finished"
