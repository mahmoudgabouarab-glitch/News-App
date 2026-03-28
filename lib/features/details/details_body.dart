import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/widgets/show_error_image.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                height: 174.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => ShowErrorImage(),
              ),
            ),
            spaceH(20),
            Text(article.title, style: theme.textTheme.bodyLarge),
            spaceH(20),
            Row(
              children: [
                Icon(Icons.edit, size: 14, color: theme.iconTheme.color),
                spaceW(5),
                Text(article.author, style: theme.textTheme.bodySmall),
                Spacer(),
                Text(
                  article.publishedAt.toFormattedDate(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            spaceH(20),
            Text(
              article.description,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            spaceH(20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              onPressed: () async => await launchUrl(Uri.parse(article.url)),
              child: Text(
                "Read More",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
