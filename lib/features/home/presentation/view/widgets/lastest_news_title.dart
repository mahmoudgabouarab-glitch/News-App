import 'package:flutter/material.dart';
import 'package:news_app/core/utils/spacing.dart';

class LastestNewsTitle extends StatelessWidget {
  const LastestNewsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        spaceH(10),
        Text(
          'Latest News',
          style: theme.textTheme.titleLarge,
        ),
        spaceH(5),
      ],
    );
  }
}
