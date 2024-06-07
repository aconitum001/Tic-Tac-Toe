import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: AppColors.primary1,
    primary: AppColors.secondary2,
    secondary: AppColors.secondary1[0],
    onSecondary: AppColors.secondary1[1],
    onSecondaryContainer: AppColors.grey3,
    primaryContainer: AppColors.grey3,
    onPrimaryContainer: AppColors.grey2,
  ),
  scaffoldBackgroundColor: AppColors.primary1,
  fontFamily: "Eczar",
);
