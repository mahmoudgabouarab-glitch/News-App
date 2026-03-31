import 'package:flutter/material.dart';

class CustomEmptyFav extends StatelessWidget {
  const CustomEmptyFav({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border, size: 64, color: Colors.grey),
          SizedBox(height: 12),
          Text('No saved articles yet!'),
        ],
      ),
    );
  }
}
