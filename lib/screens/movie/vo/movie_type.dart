enum MovieType {
  popular("popular"),
  nowPlaying("now-playing"),
  comingSoon("coming-soon");

  const MovieType(this.urlPath);

  final String urlPath;
}
