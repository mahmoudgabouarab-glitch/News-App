import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Center(
      child: CupertinoActivityIndicator(
        radius: 14.r,
        color: isDark ? CupertinoColors.systemGrey4 : theme.colorScheme.primary,
      ),
    );
  }
}
