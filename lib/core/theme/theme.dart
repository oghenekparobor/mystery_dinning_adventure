import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_dinning_adventure/core/extension/context.dart';

ThemeData theme(BuildContext context) => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        bodySmall: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 15.sp,
        ),
        displayLarge: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 40.sp,
        ),
        bodyMedium: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: const Color(0xFF0E0E0D),
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 32.sp,
        ),
        labelMedium: TextStyle(
          color: const Color.fromARGB(255, 24, 24, 24),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      primaryColor: Colors.black,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: Colors.black,
            primary: Colors.black,
          ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Color(0xFF373737),
          ),
        ),
        buttonColor: const Color(0xFF373737),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        textTheme: ButtonTextTheme.primary,
        disabledColor: Colors.grey,
      ),
      canvasColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      primaryIconTheme: const IconThemeData(color: Colors.black),
      cardTheme: CardTheme(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: const Color(0xFF373737), width: 1.sp),
        ),
        elevation: 0,
      ),
      dialogTheme: context.dialogTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: const Color(0xFF373737), width: 1.sp),
        ),
      ),
      appBarTheme: context.appbarTheme.copyWith(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF373737)),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: const Color(0xFF373737),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        hintStyle: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          height: 1.6,
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        headerBackgroundColor: Colors.black,
        rangePickerBackgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
        ),
        dayStyle: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        headerHeadlineStyle: TextStyle(
          color: const Color(0xFF0E0E0D),
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        todayBorder: BorderSide(
          color: Colors.black,
          width: 2.w,
        ),
        rangePickerShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
        ),
      ),
    );
