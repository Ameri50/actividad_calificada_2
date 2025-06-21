class MoviePlatform {
  final String name;
  final String url;

  MoviePlatform(this.name, this.url);
}

class Movie {
  final String title;
  final String imageUrl;
  final String description;
  final String summary;
  final List<MoviePlatform> platforms;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.summary,
    required this.platforms,
  });
}
