import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/home/presentation/view_model/home_provider.dart';
import 'package:news_app/features/news_details/presentation/view/details_view.dart';

class ListOfLatestNews extends ConsumerWidget {
  const ListOfLatestNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(latestNewsProvider);
    return newsState.when(
      skipLoadingOnReload: true,
      data: (data) {
        return SizedBox(
          height: 172.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.articles.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final article = data.articles[index];
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
            },
          ),
        );
      },
      error: (error, _) {
        if (error is ServiseFailure) {
          return Text(error.errormessage);
        } else {
          return Text(error.toString());
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
