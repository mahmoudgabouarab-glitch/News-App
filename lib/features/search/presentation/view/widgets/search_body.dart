import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/widgets/custom_loading.dart';
import 'package:news_app/features/search/presentation/view/widgets/one_item_of_search.dart';
import 'package:news_app/features/search/presentation/view_model/search_provider.dart';

class SearchBody extends ConsumerWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchProvider);
    return state.when(
      data: (data) {
        if (data.articles.isEmpty) {
          return const Center(child: Text("No Data Found"));
        }
        return ListView.builder(
          itemCount: data.articles.length,
          itemBuilder: (BuildContext context, int index) {
            final article = data.articles[index];
            return OneItemOfSearch(article: article);
          },
        );
      },
      error: (error, _) =>
          Center(child: Text(error.toString(), textAlign: TextAlign.center)),
      loading: () => CustomLoading(),
    );
  }
}
