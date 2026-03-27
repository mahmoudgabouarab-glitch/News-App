import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/presentation/view/widgets/one_item_of_latest_news.dart';
import 'package:news_app/features/home/presentation/view_model/home_provider.dart';

class ListOfLatestNews extends ConsumerWidget {
  const ListOfLatestNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(latestNewsProvider);
    return newsState.when(
      data: (data) {
        return SizedBox(
          height: 172.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: data.articles.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final article = data.articles[index];
              return OneItemOfLatestNews(article: article);
            },
          ),
        );
      },
      error: (error, _) {
        return Text(error.toString());
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
