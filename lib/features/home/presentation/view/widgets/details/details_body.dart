import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/home/presentation/view/widgets/details/details_read_more_btn.dart';
import 'package:news_app/features/home/presentation/view/widgets/details/photo_view_details.dart';
import 'package:news_app/features/home/presentation/view/widgets/details/sub_line_title_details.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class DetailsBody extends StatelessWidget {
  final Article article;
  const DetailsBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(20.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            PhotoViewDetails(article: article),
            spaceH(20),
            Text(article.title, style: theme.textTheme.bodyLarge),
            spaceH(20),
            SubLineTitleDetails(article: article),
            spaceH(20),
            Text(
              article.description,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            spaceH(20),
            DetailsReadMoreBtn(article: article),
          ],
        ),
      ),
    );
  }
}

