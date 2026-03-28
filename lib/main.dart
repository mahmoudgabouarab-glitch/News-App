import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/news_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ScreenUtilInit(designSize: Size(360, 800), child: NewsApp()),
    ),
  );
}
