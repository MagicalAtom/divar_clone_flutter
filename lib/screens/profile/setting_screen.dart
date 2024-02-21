import 'package:flutter/material.dart';
import 'package:sanjagh/components/app_bar_component.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const route = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('تنظیمات'),
      body: Column(),
    );
  }
}