import 'package:flutter/material.dart';

/*
using text widget easy
*/
class CustomText extends StatelessWidget {
   CustomText({super.key,required this.text,this.fontSize,this.fontFamily,this.color,this.textDirection,this.size});
  String text;
  final fontSize;
  String? fontFamily;
  Color? color;
  TextDirection? textDirection;
  double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
        ),
        textDirection: textDirection,
      ),
    );
  }
}