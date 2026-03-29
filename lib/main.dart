import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/network/cache_helper.dart';
import 'package:news_app/features/favorite/data/model/local_fav_model.dart';
import 'package:news_app/news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalFavModelAdapter());
  await Hive.openBox<LocalFavModel>("favorite");
  runApp(
    const ProviderScope(
      child: ScreenUtilInit(designSize: Size(360, 800), child: NewsApp()),
    ),
  );
}
