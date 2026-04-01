import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/features/favorite/presentation/view/favorite_view.dart';

class FavDrawerBtn extends StatelessWidget {
  const FavDrawerBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.favorite),
      title: Text('Favorites'),
      onTap: () => context.push(FavoriteView()),
    );
  }
}
