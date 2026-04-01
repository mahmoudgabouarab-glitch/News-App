import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/core/widgets/custom_appbar.dart';
import 'package:news_app/features/home/presentation/view/widgets/details/details_body.dart';

class DetailsView extends StatelessWidget {
  final Article article;
  const DetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Details'),
      body: DetailsBody(article: article),
    );
  }
}
