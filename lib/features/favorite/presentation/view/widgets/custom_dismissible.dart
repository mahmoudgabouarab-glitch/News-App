import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/favorite/presentation/view_model/fav_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/features/favorite/data/model/local_fav_model.dart';

class CustomDismissible extends ConsumerWidget {
  final Widget child;
  final LocalFavModel fav;
  const CustomDismissible({super.key, required this.fav, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(fav.url),
      direction: DismissDirection.horizontal,
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(Icons.open_in_browser, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          await launchUrl(Uri.parse(fav.url));
          return false;
        }
        if (direction == DismissDirection.endToStart) {
          return true;
        }
        return false;
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          ref.read(favProvider.notifier).removeFav(fav.url);
        }
      },
      child: child,
    );
  }
}
