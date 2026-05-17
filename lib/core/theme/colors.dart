import 'package:flutter/material.dart';
import 'package:music_app/core/util/cubit/home_cubit.dart';

// const Color primaryColor = Color(0xFF2600EE);
// static const Color scaffoldDarkBackgroundColor = Color(0xFF2F302E);

class ColorsManager {
  static Color get primaryColor => Color(0xFF009688);
  // static Color get primaryColor2 => homeCubit.isDarkMode ? Color(0xFF000000) : Color(0xFF009688);
  static const Color primaryDarkColor = Color(0xFF000000);
  static const Color scaffoldBackgroundColor = Color(0xFFF5F5F5);
  static const Color scaffoldDarkBackgroundColor = Color(0xFF2F302E);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  // static const Color textColor = Color(0xFF2F302E);
  static const Color greyColor = Color(0xFFBDBDBD);
  static const Color darkGreyColor = Color(0xFF757575);
  static const Color lightGreyColor = Color(0xFFE0E0E0);
  // static Color  textColor = HomeCubit().isDarkMode ? Color(0xFFFFFFFF) : Color(0xFF2F302E);
  static Color get textColor => HomeCubit().isDarkMode ? Color(0xFFF5F5F5) : Color(0xFF2F302E);

////
  static const Color grey = Color(0xFFBDBDBD);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF707070);
  static const Color lightBlack = Color(0xFF212121);

////////////////////////ico 0xFF292727
  /// IconsColors
  static const Color iconLight = Color(0xFF585957);
  static const Color iconsDark = Color(0xFFE0E0E0);

  /// Colors
  static const Color errorColor = Color(0xFFB00020);
  static const Color greenColor = Color(0xFF009688);
  static const Color yellowColor = Color(0xFFFF9500);
  static const Color blueColor = Color(0xFF007acc);
  static const Color purpleColor = Color(0xFF9C27B0);
  static const Color orangeColor = Color(0xFFFF6600);
  static const Color transparent = Color(0x00000000);
}
