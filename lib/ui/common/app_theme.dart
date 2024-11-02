import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/common/app_colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    primaryColor: AppColors.kPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(
      // background: AppColors.kBackgoundColor,
      brightness: Brightness.light,
      error: AppColors.kErrorColor,
      errorContainer: AppColors.kErrorColor,
      primary: AppColors.kPrimaryColor,
    ),
    scaffoldBackgroundColor: AppColors.kBackgoundColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.kPrimaryColor,
      disabledColor: AppColors.kGreyColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.kSkyBlueColor,
        disabledBackgroundColor: AppColors.kGreyColor,
        foregroundColor: AppColors.kWhiteColor,
        disabledForegroundColor: AppColors.kWhiteColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        textStyle: GoogleFonts.poppins(
          color: AppColors.kWhiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.kBlackColor,
          fontWeight: FontWeight.w800,
          fontSize: 32,
        ),
        displayMedium: TextStyle(
          color: AppColors.kBlackColor,
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
        displaySmall: TextStyle(
          color: AppColors.kBlackColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        headlineLarge: TextStyle(
          color: AppColors.kBlackColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          color: AppColors.kBlackColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        bodyMedium: TextStyle(
          color: AppColors.kBlackColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: AppColors.kBlackColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.kPrimaryColor),
      checkColor: WidgetStateProperty.all(AppColors.kWhiteColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        disabledBackgroundColor: AppColors.kGreyColor,
        foregroundColor: AppColors.kWhiteColor,
        disabledForegroundColor: AppColors.kWhiteColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        side: const BorderSide(
          color: AppColors.kSkyBlueColor,
          width: 1,
        ),
        textStyle: GoogleFonts.poppins(
          color: AppColors.kWhiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.kLightGreyColor,
        foregroundColor: AppColors.kBlackColor,
        alignment: Alignment.center,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.kLightGreyColor,
      showCheckmark: false,
      side: BorderSide.none,
      disabledColor: AppColors.kGreyColor,
      labelStyle: GoogleFonts.poppins(
        color: AppColors.kWhiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      selectedColor: AppColors.kPrimaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.kPrimaryColor,
      elevation: 0,
      selectedItemColor: AppColors.kWhiteColor,
      unselectedItemColor: AppColors.kGreyColor,
      showUnselectedLabels: true,
      selectedLabelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    useMaterial3: true,
  );
}
