import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/search/presentation/view/search_view.dart';
import 'package:news_app/features/search/presentation/view_model/search_provider.dart';

class SearchFiled extends ConsumerWidget {
  const SearchFiled({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final TextEditingController controller = TextEditingController();
    return TextFormField(
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        fillColor: theme.colorScheme.surface,
        filled: true,
        suffixIcon: MaterialButton(
          elevation: 0,
          onPressed: () {
            if (controller.text.trim().isEmpty) return _snackBar(context);
            ref.read(searchStateProvider.notifier).state = controller.text;
            context.push(const SearchView());
          },
          height: 40.h,
          minWidth: 40.w,
          color: theme.colorScheme.primary,
          shape: const CircleBorder(),
          child: Icon(Icons.arrow_forward, size: 22.r, color: Colors.white),
        ),
        prefixIcon: Icon(Icons.search, size: 22.r, color: theme.hintColor),
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
        hintStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
      ),
    );
  }
}

void _snackBar(BuildContext context) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      shape: const StadiumBorder(),
      backgroundColor: theme.colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      content: Row(
        children: [
          Icon(Icons.error, color: theme.colorScheme.onPrimary, size: 30.r),
          spaceW(10),
          Text(
            'Please enter something',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
