import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_appbar.dart';
import 'package:news_app/features/search/presentation/view/widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Search'),
      body: const SearchBody(),
    );
  }
}
