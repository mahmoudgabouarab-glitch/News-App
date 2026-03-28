import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/cache_helper.dart';
import 'package:news_app/features/home/presentation/view_model/theme_provider.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(themeProvider);
    return AppBar(
      title: Text('News', style: Theme.of(context).appBarTheme.titleTextStyle),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            final newTheme = current == ThemeMode.dark
                ? ThemeMode.light
                : ThemeMode.dark;
            ref.read(themeProvider.notifier).state = newTheme;
            await CacheHelper.saveData(key: "theme", value: newTheme.name);
          },
          icon: current == ThemeMode.dark
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
