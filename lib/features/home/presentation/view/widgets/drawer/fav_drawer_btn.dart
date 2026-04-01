import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/features/favorite/presentation/view/favorite_view.dart';

class FavDrawerBtn extends StatelessWidget {
  const FavDrawerBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(Icons.favorite, color: theme.iconTheme.color),
      title: Text(
        'Favorites',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
      onTap: () => context.push(FavoriteView()),
    );
  }
}
