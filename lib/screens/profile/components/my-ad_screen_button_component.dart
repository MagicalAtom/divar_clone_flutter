import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

Widget myAddButton(Color color,VoidCallback onTap,String text){
return    GestureDetector(
            onTap: onTap,
            child: Container(
              width: SizeConfig.screenWidth,
              height: 40,
              decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppSize.level1),  
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: text,color: AppColor.white,fontFamily: Font.name('m'),fontSize: Font.size(2) - 2,),
                ],
              ),
            ),
          );
}