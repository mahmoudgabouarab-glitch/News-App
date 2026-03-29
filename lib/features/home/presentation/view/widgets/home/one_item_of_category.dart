import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/widgets/show_error_image.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/home/presentation/view/details_view.dart';

class OneItemOfCategory extends StatelessWidget {
  const OneItemOfCategory({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: () => context.push(DetailsView(article: article)),
        child: SizedBox(
          height: 105.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage,
                  width: 95.w,
                  height: 105.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => ShowErrorImage(),
                ),
              ),
              spaceW(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    spaceH(5),
                    Text(article.author, style: theme.textTheme.bodySmall),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            article.source.name,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Spacer(),
                        Text(
                          article.publishedAt.toFormattedDate(),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
