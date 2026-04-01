import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';

class ShowErrorImage extends StatelessWidget {
  const ShowErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.defultimage, fit: BoxFit.cover);
  }
}
