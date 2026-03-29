import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/favorite/data/model/local_fav_model.dart';
import 'package:news_app/features/favorite/data/repo/fav_repo.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class FavState extends Equatable {
  final List<LocalFavModel> favArticles;
  final bool isLoading;
  final String? errorMessage;

  const FavState({
    this.favArticles = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  FavState copyWith({
    List<LocalFavModel>? favArticles,
    bool? isLoading,
    String? errorMessage,
  }) {
    return FavState(
      favArticles: favArticles ?? this.favArticles,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [favArticles, isLoading, errorMessage];
}

class FavNotifier extends StateNotifier<FavState> {
  final FavRepo _repo;
  FavNotifier(this._repo) : super(const FavState()) {
    loadFav();
  }

  void loadFav() {
    state = state.copyWith(isLoading: true);
    try {
      final articles = _repo.getFav();
      state = state.copyWith(favArticles: articles, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> toggleFav(Article article) async {
    if (_repo.isSaved(article.url)) {
      await _repo.removeFav(article.url);
    } else {
      await _repo.addFav(article);
    }
    loadFav();
  }

  Future<void> removeFav(String url) async {
    await _repo.removeFav(url);
    loadFav();
  }

  bool isSaved(String url) => _repo.isSaved(url);
}

final favProvider = StateNotifierProvider<FavNotifier, FavState>((ref) {
  final repo = ref.watch(favRepoProvider);
  return FavNotifier(repo);
});
