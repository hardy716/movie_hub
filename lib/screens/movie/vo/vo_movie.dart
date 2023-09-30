class MovieModel {
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";
  final String title, thumb, id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        thumb = "$baseImgUrl${json['backdrop_path'] ?? ''}",
        id = json['id'].toString() ?? '';
}
