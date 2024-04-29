import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

showMessage(String message,BuildContext context){
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(text: message,color:Colors.white,fontFamily: Font.name('b'),),
      ],
    ),
    backgroundColor: AppColor.main,
    elevation: 5,
    padding: const EdgeInsets.all(AppSize.level1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}