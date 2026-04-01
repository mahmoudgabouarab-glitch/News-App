import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/cache_helper.dart';
import 'package:news_app/features/home/presentation/view_model/theme_provider.dart';

class ThemeDrawerBtn extends ConsumerWidget {
  const ThemeDrawerBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final current = ref.watch(themeProvider);
    return ListTile(
      leading: current != ThemeMode.dark
          ? Icon(Icons.light_mode_outlined, color: theme.iconTheme.color)
          : Icon(Icons.dark_mode_outlined, color: theme.iconTheme.color),
      title: Text(
        current != ThemeMode.dark ? 'Light' : 'Dark',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      onTap: () {
        final notifier = ref.read(themeProvider.notifier);
        final isDark = notifier.state == ThemeMode.dark;
        final newTheme = isDark ? ThemeMode.light : ThemeMode.dark;
        notifier.state = newTheme;
        CacheHelper.saveData(key: "theme", value: newTheme.name);
      },
    );
  }
}
