import 'package:flutter/material.dart';
import 'package:music_app/core/theme/colors.dart';
import 'package:music_app/core/theme/text_styles.dart';

class ThemesManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor: ColorsManager.scaffoldBackgroundColor,
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteColor,
      titleTextStyle: TextStylesManager.medium18.copyWith(
        color: ColorsManager.blackColor,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.blackColor,
      ),
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: ColorsManager.blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.whiteColor,
      selectedItemColor: ColorsManager.primaryColor,
      unselectedItemColor: ColorsManager.grey,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        color: ColorsManager.primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        color: ColorsManager.grey,
      ),
      selectedIconTheme: IconThemeData(
        color: ColorsManager.primaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsManager.grey,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primaryColor,
      foregroundColor: ColorsManager.whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.primaryColor,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.blackColor,
        ),
      ),
    ),
    // textTheme: TextTheme(
    //   bodyLarge: TextStylesManager.medium18.copyWith(
    //     color: ColorsManager.blackColor,
    //   ),
    //   bodyMedium: TextStylesManager.medium16.copyWith(
    //     color: ColorsManager.blackColor,
    //   ),
    //   bodySmall: TextStylesManager.medium14.copyWith(
    //     color: ColorsManager.blackColor,
    //   ),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.whiteColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      hintStyle: TextStyle(
        color: ColorsManager.blackColor,
      ),
      labelStyle: TextStyle(
        color: ColorsManager.blackColor,
      ),
      prefixIconColor: ColorsManager.blackColor,
      prefixStyle: TextStyle(
        color: ColorsManager.blackColor,
      ),
      suffixIconColor: ColorsManager.blackColor,
      suffixStyle: TextStyle(color: ColorsManager.grey),
      errorStyle: TextStyle(
        color: ColorsManager.errorColor,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.grey,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.blackColor,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
      trackColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: ColorsManager.primaryColor,
      inactiveTrackColor: ColorsManager.primaryColor,
      thumbColor: ColorsManager.primaryColor,
      valueIndicatorColor: ColorsManager.primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.primaryColor,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.primaryColor,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.primaryColor,
      selectionColor: ColorsManager.primaryColor,
      selectionHandleColor: ColorsManager.primaryColor,
    ),
    iconTheme: IconThemeData(
      color: ColorsManager.iconLight,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.whiteColor,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor: ColorsManager.scaffoldDarkBackgroundColor,
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryDarkColor,
      titleTextStyle: TextStylesManager.medium18.copyWith(
        color: ColorsManager.whiteColor,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsManager.whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primaryDarkColor,
      selectedItemColor: ColorsManager.primaryColor,
      unselectedItemColor: ColorsManager.grey,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        color: ColorsManager.primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        color: ColorsManager.grey,
      ),
      selectedIconTheme: IconThemeData(
        color: ColorsManager.primaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsManager.grey,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primaryColor,
      foregroundColor: ColorsManager.whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.primaryColor,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.whiteColor,
        ),
      ),
    ),
    // textTheme: TextTheme(
    //   bodyMedium: TextStylesManager.medium16.copyWith(
    //     color: ColorsManager.whiteColor,
    //   ),
    //   bodyLarge: TextStylesManager.medium18.copyWith(
    //     color: ColorsManager.whiteColor,
    //   ),
    //   bodySmall: TextStylesManager.medium14.copyWith(
    //     color: ColorsManager.whiteColor,
    //   ),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.primaryDarkColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      hintStyle: TextStyle(
        color: ColorsManager.grey,
      ),
      labelStyle: TextStyle(
        color: ColorsManager.grey,
      ),
      prefixIconColor: ColorsManager.grey,
      prefixStyle: TextStyle(
        color: ColorsManager.grey,
      ),
      suffixIconColor: ColorsManager.grey,
      suffixStyle: TextStyle(color: ColorsManager.grey),
      errorStyle: TextStyle(
        color: ColorsManager.errorColor,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: ColorsManager.grey,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
      checkColor: WidgetStateProperty.all<Color>(
        ColorsManager.whiteColor,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
      trackColor: WidgetStateProperty.all<Color>(
        ColorsManager.primaryColor,
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: ColorsManager.primaryColor,
      inactiveTrackColor: ColorsManager.grey,
      thumbColor: ColorsManager.primaryColor,
      valueIndicatorColor: ColorsManager.primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.primaryColor,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.whiteColor,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.primaryColor,
      selectionColor: ColorsManager.primaryColor,
      selectionHandleColor: ColorsManager.primaryColor,
    ),
    iconTheme: IconThemeData(
      color: ColorsManager.iconsDark,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          ColorsManager.whiteColor,
        ),
      ),
    ),
  );
}
