import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/core/widgets/show_error_image.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsBody extends StatelessWidget {
  final Article article;
  const DetailsBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
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
            Text(
              article.title,
              style: Styles.s15_600.copyWith(color: AppColor.textPrimary),
            ),
            spaceH(20),
            Row(
              children: [
                Icon(Icons.edit, size: 14, color: Colors.grey),
                spaceW(5),
                Text(
                  article.author,
                  style: Styles.s9_800.copyWith(color: AppColor.textSecondary),
                ),
                Spacer(),
                Text(
                  article.publishedAt.toFormattedDate(),
                  style: Styles.s9_800.copyWith(color: AppColor.textThrird),
                ),
              ],
            ),
            spaceH(20),
            Text(
              article.description,
              style: Styles.s15_400.copyWith(color: AppColor.textPrimary),
            ),
            spaceH(20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.textThrird,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              onPressed: () async => await launchUrl(Uri.parse(article.url)),
              child: Text(
                "Read More",
                style: Styles.s15_600.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
