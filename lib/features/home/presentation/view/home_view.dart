import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_appbar.dart';
import 'package:news_app/features/home/presentation/view/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppbar(), body: const HomeBody());
  }
}
