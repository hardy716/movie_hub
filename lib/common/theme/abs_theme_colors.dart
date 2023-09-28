import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get backgroundColor => AppColors.white;

  Color get textColor => AppColors.black;

  Color get accentColor => AppColors.yellow;
}
