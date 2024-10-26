import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.whiteColor,
        statusBarBrightness: Brightness.light,
      ),
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: const TextTheme().apply(
      bodyColor: AppColors.blackBaseColor,
      displayColor: AppColors.blackBaseColor,
    ),
    iconTheme: const IconThemeData().copyWith(
      color: AppColors.blackBaseColor,
    ));
