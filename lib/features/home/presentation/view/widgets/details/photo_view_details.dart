import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/show_error_image.dart';
import 'package:news_app/features/home/data/model/news_response.dart';

class PhotoViewDetails extends StatelessWidget {
  const PhotoViewDetails({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: CachedNetworkImage(
        imageUrl: article.urlToImage,
        height: 174.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => ShowErrorImage(),
      ),
    );
  }
}

