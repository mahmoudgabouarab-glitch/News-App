import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news_app.dart';

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
          onPressed: () {
            if (current == ThemeMode.dark) {
              ref.read(themeProvider.notifier).state = ThemeMode.light;
            } else {
              ref.read(themeProvider.notifier).state = ThemeMode.dark;
            }
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
