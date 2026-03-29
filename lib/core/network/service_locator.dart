import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/api_service.dart';
import 'package:news_app/features/favorite/data/repo/fav_repo.dart';
import 'package:news_app/features/favorite/data/repo/fav_repo_impl.dart';
import 'package:news_app/features/home/data/repo/home_repo.dart';
import 'package:news_app/features/home/data/repo/home_repo_impl.dart';
import 'package:news_app/features/search/data/repo/search_repo.dart';
import 'package:news_app/features/search/data/repo/search_repo_impl.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final apiServiceProvider = Provider<ApiServise>((ref) {
  final dio = ref.read(dioProvider);
  return ApiServise(dio);
});

final homeRepoProvider = Provider<HomeRepo>((ref) {
  final api = ref.read(apiServiceProvider);
  return HomeRepoImpl(api);
});

final searchRepoProvider = Provider<SearchRepo>((ref) {
  final api = ref.read(apiServiceProvider);
  return SearchRepoImpl(api);
});
final favRepoProvider = Provider<FavRepo>((ref) {
  return FavRepoImpl();
});
