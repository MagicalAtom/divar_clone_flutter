import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';

class LastViewWidget extends StatelessWidget {
  LastViewWidget({super.key,required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.level1),
        border: Border.all(width: 2,color: AppColor.border!)
      ),
      child: Text(title,style: TextStyle(
        fontFamily: Font.name('m'),fontSize: Font.size(1) + 6,color: Colors.black87
      ),textAlign: TextAlign.center,),
    );
  }
}