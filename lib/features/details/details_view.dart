import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:news_app/features/details/details_body.dart';

class DetailsView extends StatelessWidget {
  final Article article;
  const DetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isback: true),
      body: DetailsBody(article: article),
    );
  }
}
