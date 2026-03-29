import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/widgets/custom_appbar.dart';
import 'package:news_app/features/favorite/presentation/view/favorite_view.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leading: IconButton(
          onPressed: () {
            context.push(FavoriteView());
          },
          icon: const Icon(Icons.favorite),
        ),
      ),
      body: const HomeBody(),
    );
  }
}
