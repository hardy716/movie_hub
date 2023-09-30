import 'package:flutter/material.dart';
import 'package:movie_hub/common/common.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/movie_api_service.dart';
import 'vo/vo_movie_detail.dart';
import 'w_rating_star.dart';

class MovieDetailScreen extends StatefulWidget {
  final String id;

  const MovieDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetailModel> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = MovieApiService.getMovieDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieDetail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var movieInfo = snapshot.data!;
          return Stack(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movieInfo.thumb),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movieInfo.thumb),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: "Back to list".text.size(16.0).make(),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16.0,
                      ),
                      onPressed: () {
                        Nav.pop(context);
                      },
                    ),
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      emptyExpanded,
                      movieInfo.title.text
                          .size(32.0)
                          .color(AppColors.white)
                          .bold
                          .make(),
                      const SizedBox(height: AppDimensions.itemSpacing5),
                      RatingStar(movieInfo: movieInfo),
                      const SizedBox(height: AppDimensions.itemSpacing30),
                      Row(
                        children: [
                          formatRuntime(movieInfo.runtime)
                              .text
                              .color(AppColors.white)
                              .make(),
                          " | ".text.color(AppColors.white).make(),
                          movieInfo.genres
                              .join(', ')
                              .text
                              .color(AppColors.white)
                              .make(),
                        ],
                      ),
                      const SizedBox(height: AppDimensions.itemSpacing50),
                      "Storyline".text.size(25.0).color(AppColors.white).make(),
                      const SizedBox(height: AppDimensions.itemSpacing10),
                      movieInfo.about.text
                          .size(15.0)
                          .color(AppColors.white)
                          .make(),
                      const SizedBox(height: AppDimensions.itemSpacing80),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.yellow,
                          ),
                          onPressed: () async {
                            final url = Uri.parse(movieInfo.pageUrl);
                            await launchUrl(url);
                          },
                          child: "Buy Ticket"
                              .text
                              .color(AppColors.black)
                              .bold
                              .make()
                              .pSymmetric(v: 15.0, h: 50.0),
                        ).offset(offset: const Offset(20.0, 0)),
                      ),
                      const SizedBox(height: AppDimensions.itemSpacing10),
                    ],
                  ).pLTRB(20.0, 0, 80.0, 0),
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  String formatRuntime(int runtime) {
    int hours = runtime ~/ 60;
    int minutes = runtime % 60;
    return '${hours}h ${minutes}min';
  }
}
