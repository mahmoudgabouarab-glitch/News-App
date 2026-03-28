import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  /// ================= LIGHT =================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: const Color(0xFFF8F8FA),

    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF9900),
      secondary: Color(0xFFFF0000),
      surface: Colors.white,
      onSurface: Color(0xFF000000),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF8F8FA),
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: .5,
      iconTheme: IconThemeData(color: Color(0xFF434343)),
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    ),

    iconTheme: const IconThemeData(color: Color(0xFF434343)),

    textTheme: TextTheme(
      // primary text
      bodyLarge: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF000000),
      ),

      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFAEAEAE),
      ),

      bodySmall: TextStyle(
        fontSize: 9.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFAEAEAE),
      ),

      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF027FC0),
      ),

      labelLarge: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF000000),
      ),

      labelMedium: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFAEAEAE),
      ),
      titleSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
    ),
  );

  /// ================= DARK =================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xFF1C2128),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFF9900),
      secondary: Color(0xFFFF0000),
      surface: Color.fromARGB(102, 58, 58, 59),
      onSurface: Color(0xFFFFFFFF),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1C2128),
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: .5,
      iconTheme: IconThemeData(color: Color(0xFFE2E2E2)),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    ),

    iconTheme: const IconThemeData(color: Color(0xFFE2E2E2)),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFFFFFFF),
      ),

      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFAEAEAE),
      ),

      bodySmall: TextStyle(
        fontSize: 9.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFAEAEAE),
      ),

      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF027FC0),
      ),

      labelLarge: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFFFFFFF),
      ),

      labelMedium: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFAEAEAE),
      ),
      titleSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
    ),
  );
}
