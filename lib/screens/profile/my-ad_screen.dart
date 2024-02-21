import 'package:flutter/material.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

class MyAdScreen extends StatelessWidget {
  const MyAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Directionality(textDirection: TextDirection.rtl, child: CustomText(text: 'آگهی های من ',fontFamily: Font.name('m'),fontSize: Font.size(1) + 5,)
),
      ),
    );
  }
}