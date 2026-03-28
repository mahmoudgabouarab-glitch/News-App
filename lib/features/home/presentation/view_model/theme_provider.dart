import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:news_app/core/network/cache_helper.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  final theme = CacheHelper.getData(key: "theme");
  if (theme != null) {
    return ThemeMode.values.byName(theme);
  }
  return ThemeMode.system;
});