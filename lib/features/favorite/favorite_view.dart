import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_appbar.dart';
import 'package:news_app/features/favorite/favorite_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: 'Favorite', actions: false),
      body: FavoriteBody(),
    );
  }
}
