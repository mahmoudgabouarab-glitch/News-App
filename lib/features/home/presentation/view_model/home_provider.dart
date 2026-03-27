import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/home/data/model/news_response.dart';


final homeProvider = FutureProvider<NewsResponse>((ref) async {
  final repo = ref.read(homeRepoProvider);
  final result = await repo.getLastestNews();
  return result.fold(
    (failure) => throw failure,
    (data) => data,
  );
});

// final homeProvider = AsyncNotifierProvider<HomeNotifier, NewsResponse>(
//   HomeNotifier.new,
// );

// class HomeNotifier extends AsyncNotifier<NewsResponse> {
//   @override
//   Future<NewsResponse> build() async {
//     final repo = ref.read(homeRepoProvider);
//     return _getNews(repo);
//   }

//   Future<NewsResponse> _getNews(HomeRepo repo) async {
//     final result = await repo.getLastestNews();

//     return result.fold(
//       (failure) => throw failure,
//       (data) => data,
//     );
//   }

//   Future<void> refresh() async {
//     final repo = ref.read(homeRepoProvider);

//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() => _getNews(repo));
//   }
// }
