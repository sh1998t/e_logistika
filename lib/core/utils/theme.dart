import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_coler.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
    brightness: Brightness.light,
    colorScheme: AppColor.customColorScheme,
    fontFamily: 'Inter',

    appBarTheme:   AppBarTheme(
      iconTheme: IconThemeData(color: AppColor.black),
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: AppColor.black,

    ),
    textTheme: GoogleFonts.interTextTheme(
      TextTheme(


        headlineLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          fontSize: 19.sp,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        titleLarge: TextStyle(
          fontSize: 17.sp,

          fontWeight: FontWeight.w500,
          color: AppColor.black,
        ),

        titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.black),
        bodyMedium: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.black),

        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColor.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColor.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColor.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
      ),
    ),
  );
}
