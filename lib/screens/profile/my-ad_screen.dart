import 'package:flutter/material.dart';
import 'package:sanjagh/components/app_bar_component.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/screens/profile/widgets/my-ad_items_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

class MyAdScreen extends StatelessWidget {
  const MyAdScreen({super.key});
  static const route = '/my-ad';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('آگهی های من'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        child: Column(
          children: [
            MyAdItemWidget(title: 'خرمگس', image: Container(color: Colors.red,), time: 'دو شب پیش')
          ],
        ),
      ),
    );
  }
}