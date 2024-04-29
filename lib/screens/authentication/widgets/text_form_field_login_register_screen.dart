import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class LoginRegisterTextField extends StatelessWidget {
   LoginRegisterTextField({super.key,required this.controller,required this.hintText,required this.prefixIcon,required this.validator});
  String hintText;
  final validator;
  Icon prefixIcon;
  TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height(10),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(fontFamily: Font.name('m'),fontSize:Font.size(1)+9),
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.level1),
                borderSide: const BorderSide(color: AppColor.black,width: 1.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.level1),
                borderSide: const BorderSide(color: AppColor.main,width: 1.8),
              ),
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(fontFamily: Font.name('m'),fontSize:Font.size(1)+8)
          ),
        ),
        height(10),
      ],
    );
  }
}
