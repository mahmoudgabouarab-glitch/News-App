import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/search/presentation/view/widgets/one_item_of_search.dart';
import 'package:news_app/features/search/presentation/view_model/search_provider.dart';

class SearchBody extends ConsumerWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchStateProvider);
    final searcharticle = ref.watch(searchProvider(searchState));
    return searcharticle.when(
      data: (data) {
        return ListView.builder(
          // padding: EdgeInsets.symmetric(horizontal: 12),
          itemCount: data.articles.length,
          itemBuilder: (BuildContext context, int index) {
            final article = data.articles[index];
            return OneItemOfSearch(article: article);
          },
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
