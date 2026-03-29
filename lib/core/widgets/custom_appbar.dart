import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/cache_helper.dart';
import 'package:news_app/features/home/presentation/view_model/theme_provider.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final bool? actions;
  const CustomAppbar({
    super.key,
    this.leading,
    this.title,
    this.actions = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(themeProvider);
    return AppBar(
      leading: leading,
      title: Text(
        title ?? 'News',
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      centerTitle: true,
      actions: actions == true
          ? [
              IconButton(
                onPressed: () async {
                  final notifier = ref.read(themeProvider.notifier);
                  final isDark = notifier.state == ThemeMode.dark;
                  final newTheme = isDark ? ThemeMode.light : ThemeMode.dark;
                  notifier.state = newTheme;
                  CacheHelper.saveData(key: "theme", value: newTheme.name);
                },
                icon: current == ThemeMode.dark
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
