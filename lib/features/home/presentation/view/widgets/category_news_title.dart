import 'package:flutter/material.dart';
import 'package:news_app/core/utils/spacing.dart';

class CategoryNewsTitle extends StatelessWidget {
  const CategoryNewsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        spaceH(10),
        Text('Category News', style: theme.textTheme.titleLarge),
        spaceH(5),
      ],
    );
  }
}
