import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/category_news.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/category_news_title.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/lastest_news_title.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/list_of_category_news.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/list_of_latest_news.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/search_filed.dart';
import 'package:news_app/features/home/presentation/view_model/category_news_provider.dart';
import 'package:news_app/features/home/presentation/view_model/latest_news_provider.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
      child: RefreshIndicator(
        color: theme.colorScheme.primary,
        onRefresh: () async {
          await ref.read(latestNewsProviderNotifier.notifier).getLatestNews();
          ref.read(categoryNewsProviderNotifier);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SearchFiled(),
                  LastestNewsTitle(),
                  ListOfLatestNews(),
                  CategoryNewsTitle(),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyHeaderDelegate(child: const CategoryNews()),
            ),
            SliverToBoxAdapter(child: const ListOfCategoryNews()),
          ],
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  double get minExtent => 33.h; // ارتفاع لما يثبت

  @override
  double get maxExtent => 40.h; // نفس القيمة عشان ميتغيرش حجمه

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    return Container(color: theme.scaffoldBackgroundColor, child: child);
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return false;
  }
}
