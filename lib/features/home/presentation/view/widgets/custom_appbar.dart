import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: 30.w),
      leadingWidth: 60.w,
      title: Text(
        'News',
        style: Styles.s17_800.copyWith(color: AppColor.titleAppbar),
      ),
      centerTitle: true,
      leading: Icon(Icons.grid_view_rounded, color: AppColor.iconColor),
      actions: [Icon(Icons.notification_add, color: AppColor.iconColor)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
