import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/model/news_response.dart';
import 'package:news_app/core/widgets/custom_appbar.dart';
import 'package:news_app/features/home/presentation/view/widgets/details/details_body.dart';
import 'package:share_plus/share_plus.dart';

class DetailsView extends StatelessWidget {
  final Article article;
  const DetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Details',
        actions: [
          IconButton(
            onPressed: () =>
                SharePlus.instance.share(ShareParams(text: article.url)),
            icon: Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: DetailsBody(article: article),
    );
  }
}
