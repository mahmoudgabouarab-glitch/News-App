import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:news_app/features/news_details/presentation/view/widgets/details_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isback: true),
      body: const DetailsBody(),
    );
  }
}
