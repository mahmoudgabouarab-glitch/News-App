import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/core/widgets/show_error_image.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      // padding: EdgeInsets.symmetric(horizontal: 12),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            color: theme.cardColor,
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://t3.ftcdn.net/jpg/14/59/00/02/360_F_1459000261_dmgS7VQnzBgRFBNnI63fsfI46VxzyLJg.jpg",
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
                          "Title",
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        spaceH(20),
                        Text(
                          "2/3/4332",
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
      },
    );
  }
}
