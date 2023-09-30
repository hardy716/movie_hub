import 'package:flutter/material.dart';
import 'common/constant/app_colors.dart';
import 'screens/movie/s_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: AppColors.white,
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 20.0),
          labelMedium: TextStyle(fontSize: 14.0),
        ),
      ),
      home: MovieScreen(),
    );
  }
}
