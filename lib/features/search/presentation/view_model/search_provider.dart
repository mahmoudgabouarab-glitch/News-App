import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:news_app/core/network/service_locator.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

final searchProvider = FutureProvider.family<NewsResponse, String>((
  ref,
  q,
) async {
  final repo = ref.read(searchRepoProvider);
  final result = await repo.searchNews(q: q);
  return result.fold((failure) => throw failure.errormessage, (data) => data);
});
final searchStateProvider = StateProvider<String>((ref) => "");
