import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/home/presentation/view/widgets/details/fav_button.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class SubLineTitleDetails extends StatelessWidget {
  const SubLineTitleDetails({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(Icons.edit, size: 14, color: theme.iconTheme.color),
        spaceW(5),
        Expanded(
          child: Text(
            article.author,
            style: theme.textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        Text(
          article.publishedAt.toFormattedDate(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        spaceW(10),
        FavBtn(article: article),
      ],
    );
  }
}
