import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/utils/styles.dart';

class LastestNewsTitle extends StatelessWidget {
  const LastestNewsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spaceH(17),
        Text(
          'Latest News',
          style: Styles.s16_800.copyWith(color: AppColor.title),
        ),
        spaceH(17),
      ],
    );
  }
}
