import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/favorite/data/model/local_fav_model.dart';
import 'package:news_app/features/favorite/data/repo/fav_repo.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class FavNotifier extends AsyncNotifier<List<LocalFavModel>> {
  late final FavRepo _repo;

  @override
  Future<List<LocalFavModel>> build() async {
    _repo = ref.read(favRepoProvider);
    return _repo.getFav();
  }

  Future<void> toggleFav(Article article) async {
    state = const AsyncLoading();
    try {
      if (_repo.isSaved(article.url)) {
        await _repo.removeFav(article.url);
      } else {
        await _repo.addFav(article);
      }

      state = AsyncData( _repo.getFav());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> removeFav(String url) async {
    state = const AsyncLoading();
    try {
      await _repo.removeFav(url);
      state = AsyncData( _repo.getFav());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
final favProvider =
    AsyncNotifierProvider<FavNotifier, List<LocalFavModel>>(
  FavNotifier.new,
);