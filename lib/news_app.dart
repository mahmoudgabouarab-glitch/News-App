import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:news_app/core/utils/app_theme.dart';
import 'package:news_app/features/home/presentation/view/home_view.dart';

class NewsApp extends ConsumerWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});
