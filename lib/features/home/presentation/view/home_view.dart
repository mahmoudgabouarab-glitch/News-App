import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_appbar.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/custom_drawer.dart';
import 'package:news_app/features/home/presentation/view/widgets/home/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppbar(),
      body: HomeBody(),
    );
  }
}
