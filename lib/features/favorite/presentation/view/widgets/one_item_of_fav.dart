import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/extension.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/widgets/show_error_image.dart';
import 'package:news_app/features/favorite/data/model/local_fav_model.dart';
import 'package:news_app/features/favorite/presentation/view/widgets/custom_dismissible.dart';

class OneItemOfFav extends ConsumerWidget {
  const OneItemOfFav({super.key, required this.fav});

  final LocalFavModel fav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return CustomDismissible(
      fav: fav,
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
    );
  }
}

