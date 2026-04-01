import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async => await launchUrl(
            Uri.parse('https://www.facebook.com/share/1DQpJzxnPV/'),
          ),
          icon: Icon(Icons.facebook, color: theme.iconTheme.color),
        ),
        IconButton(
          onPressed: () async =>
              await launchUrl(Uri.parse('https://wa.me/qr/JQQJIXJTEHERN1')),
          icon: Icon(Icons.phone, color: theme.iconTheme.color),
        ),
        IconButton(
          onPressed: () => launchUrl(Uri.parse('https://t.me/MGA690')),
          icon: Icon(Icons.telegram, color: theme.iconTheme.color),
        ),
      ],
    );
  }
}
