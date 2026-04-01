import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/view/widgets/drawer/fav_drawer_btn.dart';
import 'package:news_app/features/home/presentation/view/widgets/drawer/theme_drawer_btn.dart';
import 'package:news_app/features/home/presentation/view/widgets/drawer/weather_feature.dart';

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
        children: const [WeatherFeature(), FavDrawerBtn(), ThemeDrawerBtn()],
      ),
    );
  }
}
