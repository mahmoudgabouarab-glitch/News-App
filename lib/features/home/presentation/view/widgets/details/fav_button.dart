import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/favorite/presentation/view_model/fav_provider.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class FavBtn extends ConsumerWidget {
  const FavBtn({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isSaved = ref
        .watch(favProvider)
        .value!
        .any((fav) => fav.url == article.url);
    return GestureDetector(
      onTap: () => ref.read(favProvider.notifier).toggleFav(article),
      child: Icon(
        isSaved ? Icons.bookmark : Icons.bookmark_border_outlined,
        size: 30,
        color: isSaved ? theme.colorScheme.primary : theme.iconTheme.color,
      ),
    );
  }
}
