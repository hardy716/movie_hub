class MovieDetailModel {
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";
  final String title, thumb, status, about, pageUrl;
  final int runtime;
  final double rating;
  final List<String> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        thumb = '$baseImgUrl${json['poster_path'] ?? ''}',
        status = json['status'] ?? '',
        about = json['overview'] ?? '',
        pageUrl = json['homepage'] ?? '',
        runtime = json['runtime'] ?? 0,
        rating = json['vote_average'] ?? 0.0,
        genres = (json['genres'] as List)
                .map((genre) => genre['name'] as String)
                .toList() ??
            [];
}
