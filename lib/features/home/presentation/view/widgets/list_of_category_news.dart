import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/home/presentation/view/widgets/one_item_of_category.dart';
import 'package:news_app/features/home/presentation/view_model/home_provider.dart';

class ListOfCategoryNews extends ConsumerWidget {
  const ListOfCategoryNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch<String>(selectedCategoryProvider);
    final newsAsync = ref.watch(categoryNewsProvider(category));
    return Expanded(
      child: newsAsync.when(
        data: (data) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.articles.length,
            itemBuilder: (context, index) {
              final article = data.articles[index];
              return OneItemOfCategory(article: article);
            },
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

