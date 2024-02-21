import 'package:flutter/material.dart';

import '../configs/fonts_application.dart';
import '../widgets/custom_text_widget.dart';

AppBar appBar(String title,){
  return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(text: title,fontFamily: Font.name('m'),fontSize: Font.size(2)),
          ],
        ),
      );
}