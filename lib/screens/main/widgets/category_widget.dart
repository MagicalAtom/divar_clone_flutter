import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class CategoryHomeWidget extends StatelessWidget {
   CategoryHomeWidget({super.key,required this.name,required this.icon});
  final icon;
  final name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: AppColor.grey,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: icon,
            ),
          ),
          height(8),
          CustomText(text: name,fontFamily: Font.name('m'),fontSize: Font.size(2) - 5,size: 200,)
        ],
      ),
    );
  }
}