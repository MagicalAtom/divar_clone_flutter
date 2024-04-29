import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

Future AlertDialogComponent({required BuildContext context,required String title,required String sub_title,required String description}) async {
  await showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Directionality(textDirection: TextDirection.rtl,child: CustomText(text: title,fontFamily: Font.name('b'),)),
      content: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListBody(
            children: <Widget>[
              CustomText(text: description,fontFamily: Font.name('b'),fontSize: 15.0,size: SizeConfig.screenWidth,),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.main,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.level1))
          ),
          child: CustomText(text: 'بستن',color: Colors.white,fontFamily: Font.name('b'),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
}