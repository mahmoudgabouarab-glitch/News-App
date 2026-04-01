import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/network/cache_helper.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/features/favorite/presentation/view/favorite_view.dart';
import 'package:news_app/features/home/presentation/view_model/theme_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Theme(
            data: theme.copyWith(
              dividerTheme: const DividerThemeData(color: Colors.transparent),
            ),
            child: DrawerHeader(
              decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("27°C", style: TextStyle(fontSize: 30)),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cairo, Egypt',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Divider(color: Colors.grey),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => context.push(FavoriteView()),
          ),
          Consumer(
            builder: (context, ref, child) {
              final current = ref.watch(themeProvider);
              return ListTile(
                leading: current != ThemeMode.dark
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
                title: Text(current != ThemeMode.dark ? 'Light' : 'Dark'),
                onTap: () {
                  final notifier = ref.read(themeProvider.notifier);
                  final isDark = notifier.state == ThemeMode.dark;
                  final newTheme = isDark ? ThemeMode.light : ThemeMode.dark;
                  notifier.state = newTheme;
                  CacheHelper.saveData(key: "theme", value: newTheme.name);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
