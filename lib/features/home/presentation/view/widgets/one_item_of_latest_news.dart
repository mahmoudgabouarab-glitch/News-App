import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/details/details_view.dart';
import 'package:flutter/material.dart';
class OneItemOfLatestNews extends StatelessWidget {
  const OneItemOfLatestNews({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(DetailsView(article: article)),
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        width: 247.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.r),
              ),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                height: 116.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 2.h,
              ),
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.s10_600.copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.edit, size: 14, color: Colors.grey),
                  spaceW(5),
                  Expanded(
                    child: Text(
                      maxLines: 1,
                      "By ${article.author}",
                      style: Styles.s9_800.copyWith(
                        color: AppColor.textSecondary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    article.publishedAt.toFormattedDate(),
                    style: Styles.s9_800.copyWith(
                      color: AppColor.textThrird,
                    ),
                  ),
                ],
              ),
            ),
            spaceH(2),
          ],
        ),
      ),
    );
  }
}
