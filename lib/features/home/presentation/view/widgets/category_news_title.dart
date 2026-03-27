import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/utils/styles.dart';

class CategoryNewsTitle extends StatelessWidget {
  const CategoryNewsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaceH(10),
        Text(
          'Category News',
          style: Styles.s16_800.copyWith(color: AppColor.title),
        ),
        spaceH(5),
      ],
    );
  }
}
