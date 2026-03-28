import 'package:flutter/material.dart';

class ShowErrorImage extends StatelessWidget {
  const ShowErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/defultimage.jpg", fit: BoxFit.cover);
  }
}
