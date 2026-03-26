import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/utils/styles.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                "https://picsum.photos/500/300",
                height: 174.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            spaceH(20),
            Text(
              "Crystals dancing to the tune of light might replace batteries",
              style: Styles.s15_600.copyWith(color: AppColor.textPrimary),
            ),
            spaceH(20),
            Row(
              children: [
                Icon(Icons.edit, size: 14, color: Colors.grey),
                spaceW(5),
                Text(
                  "Amal Jos Chacko",
                  style: Styles.s9_800.copyWith(color: AppColor.textSecondary),
                ),
                Spacer(),
                Text(
                  "5 hours ago",
                  style: Styles.s9_800.copyWith(color: AppColor.textThrird),
                ),
              ],
            ),
            spaceH(20),
            Text(
              "In a groundbreaking development, researchers from the Hayward Research Group at CU Boulder have unveiled a novel photomechanical material that has the potential to revolutionize various industries by converting light energy into mechanical work.",
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
              onPressed: () {},
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
