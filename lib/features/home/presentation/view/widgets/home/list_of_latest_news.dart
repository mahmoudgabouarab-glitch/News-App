import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/custom_loading.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/one_item_of_latest_news.dart';
import 'package:news_app/features/home/presentation/view_model/latest_news_provider.dart';

class ListOfLatestNews extends ConsumerStatefulWidget {
  const ListOfLatestNews({super.key});

  @override
  ConsumerState<ListOfLatestNews> createState() => _ListOfLatestNewsState();
}

class _ListOfLatestNewsState extends ConsumerState<ListOfLatestNews> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(latestNewsProviderNotifier.notifier).getLatestNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(latestNewsProviderNotifier);
    return state.when(
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
      error: (error, _) => Text(error.toString()),
      loading: () => const CustomLoading(),
    );
  }
}
