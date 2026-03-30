import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/category_news.dart';

class CategoryNewsNotifier extends AsyncNotifier<NewsResponse> {
  late final _repo = ref.read(homeRepoProvider);
  @override
  FutureOr<NewsResponse> build() async {
    final category = ref.watch(selectedCategoryProvider);
    final result = await _repo.getCategoryNews(category: category);
    return result.fold((failure) => throw failure.errormessage, (data) => data);
  }
}

final categoryNewsProviderNotifier =
    AsyncNotifierProvider<CategoryNewsNotifier, NewsResponse>(
      CategoryNewsNotifier.new,
    );

final selectedCategoryProvider = StateProvider<String>((ref) => categories[0]);
