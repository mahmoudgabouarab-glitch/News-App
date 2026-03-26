import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/utils/styles.dart';

class ListOfCategoryNews extends StatelessWidget {
  const ListOfCategoryNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: SizedBox(
              height: 105.h,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      "https://picsum.photos/100",
                      width: 95.w,
                      height: 105.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  spaceW(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "US Counterintelligence warns of spy risks to space technology",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.s10_600.copyWith(
                            color: AppColor.textPrimary,
                          ),
                        ),
                        spaceH(5),
                        Text(
                          "Rizwan Choudhury",
                          style: Styles.s9_800.copyWith(
                            color: AppColor.textSecondary,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Innovation",
                              style: Styles.s9_800.copyWith(
                                color: AppColor.title,
                              ),
                            ),
                            Text(
                              "12 hours ago",
                              style: Styles.s9_800.copyWith(
                                color: AppColor.textThrird,
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
          );
        },
      ),
    );
  }
}
