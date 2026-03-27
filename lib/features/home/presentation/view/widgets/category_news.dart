import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/features/home/presentation/view_model/home_provider.dart';

class CategoryNews extends ConsumerStatefulWidget {
  const CategoryNews({super.key});

  @override
  ConsumerState<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends ConsumerState<CategoryNews> {
  int isActive = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final title = categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                isActive = index;
              });
              ref.read(selectedCategoryProvider.notifier).state = title;
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                color: isActive == index ? AppColor.textThrird : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: isActive == index ? Colors.white : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> categories = [
  "Business",
  "Entertainment",
  "Health",
  "Science",
  "Sports",
  "Technology",
];
