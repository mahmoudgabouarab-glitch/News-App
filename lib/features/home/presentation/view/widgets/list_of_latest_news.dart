import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/news_details/presentation/view/details_view.dart';

class ListOfLatestNews extends StatelessWidget {
  const ListOfLatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
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
                      "https://picsum.photos/300/200",
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Text(
                      "Crystals dancing to the tune of light might replace batteries",
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
                          "Author",
                          style: Styles.s9_800.copyWith(
                            color: AppColor.textSecondary,
                          ),
                        ),
                        Text(
                          "5 hours ago",
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
  }
}
