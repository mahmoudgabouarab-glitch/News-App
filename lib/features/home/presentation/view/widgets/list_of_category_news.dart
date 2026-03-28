import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/custom_loading.dart';
import 'package:news_app/features/home/presentation/view/widgets/one_item_of_category.dart';
import 'package:news_app/features/home/presentation/view_model/home_provider.dart';

class ListOfCategoryNews extends ConsumerWidget {
  const ListOfCategoryNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch<String>(selectedCategoryProvider);
    final newsAsync = ref.watch(categoryNewsProvider(category));
    return newsAsync.when(
      data: (data) {
        return ListView.builder(
          padding: EdgeInsets.only(top: 16.h),
          shrinkWrap: true,
          itemCount: data.articles.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final article = data.articles[index];
            return OneItemOfCategory(article: article);
          },
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CustomLoading(),
    );
  }
}
