import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/category_news.dart';

// latest news

final latestNewsProvider = FutureProvider<NewsResponse>((ref) async {
  final repo = ref.read(homeRepoProvider);
  final result = await repo.getLastestNews();
  return result.fold((failure) => throw failure.errormessage, (data) => data);
});

// category news

final categoryNewsProvider = FutureProvider.family<NewsResponse, String>((
  ref,
  category,
) async {
  final repo = ref.read(homeRepoProvider);
  final result = await repo.getCategoryNews(category: category);
  return result.fold((failure) => throw failure.errormessage, (data) => data);
});

final selectedCategoryProvider = StateProvider<String>((ref) => categories[0]);
