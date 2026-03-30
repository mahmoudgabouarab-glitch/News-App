import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/presentation/view_model/category_news_provider.dart';
import 'package:news_app/features/home/presentation/view_model/latest_news_provider.dart';

class CategoryNews extends ConsumerStatefulWidget {
  const CategoryNews({super.key});

  @override
  ConsumerState<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends ConsumerState<CategoryNews> {
  int isActive = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final title = categories[index];
        return GestureDetector(
          onTap: () {
            setState(() => isActive = index);
            ref.read(selectedCategoryProvider.notifier).state = title;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.symmetric(
              horizontal: isActive == index ? 30.w : 18.w,
            ),
            decoration: BoxDecoration(
              color: isActive == index
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20.r),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: isActive == index
                    ? theme.colorScheme.onPrimary
                    : theme.textTheme.bodySmall?.color,
              ),
            ),
          ),
        );
      },
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
