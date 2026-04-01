import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/api_keys.dart';
import 'package:news_app/core/network/api_service.dart';
import 'package:news_app/features/favorite/data/repo/fav_repo.dart';
import 'package:news_app/features/favorite/data/repo/fav_repo_impl.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';
import 'package:news_app/features/home/data/repo/home_repo_impl.dart';
import 'package:news_app/features/search/data/repo/search_repo.dart';
import 'package:news_app/features/search/data/repo/search_repo_impl.dart';

// ------------------ News Api ------------------

final newsApiProvider = Provider<ApiService>((ref) {
  return ApiService(
    Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseNewsUrl,
        headers: {"Authorization": 'Bearer ${ApiKeys.myTokenNews}'},
      ),
    ),
  );
});

final homeRepoProvider = Provider<HomeRepo>((ref) {
  final api = ref.read(newsApiProvider);
  return HomeRepoImpl(api);
});

final searchRepoProvider = Provider<SearchRepo>((ref) {
  final api = ref.read(newsApiProvider);
  return SearchRepoImpl(api);
});
final favRepoProvider = Provider<FavRepo>((ref) {
  return FavRepoImpl();
});

//------------------ Weather Api ------------------

final weatherApiProvider = Provider<ApiService>((ref) {
  return ApiService(
    Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseWeatherUrl,
        headers: {"Authorization": 'Bearer ${ApiKeys.myTokenWeather}'},
      ),
    ),
  );
});
