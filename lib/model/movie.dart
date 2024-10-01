class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String director;
  final String summary;
  final String image;
  final List<Genre> genres;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.summary,
    required this.image,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    var genreList = json['genres'] as List;
    List<Genre> genres = genreList.map((i) => Genre.fromJson(i)).toList();

    return Movie(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      summary: json['summary'],
      image: json['image'],
      genres: genres,
    );
  }
}

class MovieResponse {
  final List<Movie> movies;

  MovieResponse({required this.movies});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    var movieList = json['data']['data'] as List;
    List<Movie> movies = movieList.map((i) => Movie.fromJson(i)).toList();

    return MovieResponse(movies: movies);
  }
}
