import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/home/presentation/view/widgets/category_news.dart';
import 'package:news_app/features/home/presentation/view/widgets/lastest_news_title.dart';
import 'package:news_app/features/home/presentation/view/widgets/list_of_category_news.dart';
import 'package:news_app/features/home/presentation/view/widgets/list_of_latest_news.dart';
import 'package:news_app/features/home/presentation/view/widgets/search_filed.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchFiled(),
          const LastestNewsTitle(),
          const ListOfLatestNews(),
          spaceH(22),
          const CategoryNews(),
          spaceH(35),
          const ListOfCategoryNews(),
        ],
      ),
    );
  }
}
