import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NavigationExtension on BuildContext {
  /// push
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  /// push replacement
  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  /// push and remove all previous pages
  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// pop
  void popPage() {
    Navigator.of(this).pop();
  }
}

extension DateFormatting on String {
  String toFormattedDate() {
    final date = DateTime.parse(this).toLocal();
    return DateFormat('dd / MM').format(date);
  }
}
