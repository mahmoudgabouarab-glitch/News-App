import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/widgets/show_error_image.dart';
import 'package:news_app/features/favorite/presentation/view_model/fav_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoriteBody extends ConsumerWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(favProvider);

    if (state.favArticles.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_border, size: 64, color: Colors.grey),
            SizedBox(height: 12),
            Text('No saved articles yet!'),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: state.favArticles.length,
      itemBuilder: (BuildContext context, int index) {
        final fav = state.favArticles[index];
        return Dismissible(
          key: Key(fav.url),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (_) {
            ref.read(favProvider.notifier).removeFav(fav.url);
          },
          child: GestureDetector(
            onTap: () async => await launchUrl(Uri.parse(fav.url)),
            child: Card(
              color: theme.cardColor,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CachedNetworkImage(
                        imageUrl: fav.urlToImage,
                        width: 120,
                        height: 100,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => ShowErrorImage(),
                      ),
                    ),
                    spaceW(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fav.title, 
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          spaceH(20),
                          Text(
                            fav.publishedAt.toFormattedDate(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spaceW(10),
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
