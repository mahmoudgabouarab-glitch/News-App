import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsReadMoreBtn extends StatelessWidget {
  const DetailsReadMoreBtn({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onPressed: () async => await launchUrl(Uri.parse(article.url)),
      child: Text(
        "Read More",
        style: theme.textTheme.labelLarge?.copyWith(color: Colors.black),
      ),
    );
  }
}
