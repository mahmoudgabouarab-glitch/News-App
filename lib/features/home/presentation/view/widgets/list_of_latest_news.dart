import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/home/presentation/view_model/home_provider.dart';
import 'package:news_app/features/news_details/presentation/view/details_view.dart';

class ListOfLatestNews extends ConsumerWidget {
  const ListOfLatestNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(homeProvider);
    return newsState.when(
      skipLoadingOnReload: true,
      data: (data) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.articles.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final article = data.articles[index];
              return GestureDetector(
                onTap: () => context.push(const DetailsView()),
                child: Container(
                  margin: EdgeInsets.only(right: 26.w),
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.network(
                          article.urlToImage,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.s10_600.copyWith(
                            color: AppColor.textPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "By ${article.author}",
                              style: Styles.s9_800.copyWith(
                                color: AppColor.textSecondary,
                              ),
                            ),
                            Text(
                              article.publishedAt,
                              style: Styles.s9_800.copyWith(
                                color: AppColor.textThrird,
                              ),
                            ),
                          ],
                        ),
                      ),
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
