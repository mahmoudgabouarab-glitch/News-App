import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:news_app/core/utils/styles.dart';

class SearchFiled extends StatelessWidget {
  const SearchFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        fillColor: Color(0xFFFFFFFF),
        filled: true,
        suffixIcon: Container(
          margin: EdgeInsets.only(right: 10.w, top: 7.h, bottom: 7.h),
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColor.textThrird,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 22.r,
          color: AppColor.textSecondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Color(0xFFDFDFDF), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Color(0xFFDFDFDF), width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Color(0xFFDFDFDF), width: 1.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Color(0xFFDFDFDF), width: 1.w),
        ),
        hintText: 'Search News...',
        hintStyle: Styles.s16_500.copyWith(color: AppColor.textSecondary),
      ),
    );
  }
}
