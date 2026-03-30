import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class LatestNewsNotifier extends AsyncNotifier<NewsResponse> {
  late final _repo = ref.read(homeRepoProvider);
  @override
  FutureOr<NewsResponse> build() {
    return NewsResponse(articles: []);
  }

  Future<void> getLatestNews() async {
    state = const AsyncLoading();
    final result = await _repo.getLastestNews();
    state = result.fold(
      (failure) => AsyncError(failure.errormessage, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}

final latestNewsProviderNotifier =
    AsyncNotifierProvider<LatestNewsNotifier, NewsResponse>(
      LatestNewsNotifier.new,
    );
