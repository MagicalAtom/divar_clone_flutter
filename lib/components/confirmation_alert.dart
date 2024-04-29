import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';



Future ConfirmationAlertComponent({context,required VoidCallback onSuccess,required VoidCallback onCancel,required String text, required String title}){
  return CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      text: text,
      title: title,
      titleTextStyle: TextStyle(fontFamily: Font.name('b'),color: Colors.black,fontSize: Font.size(2)),
      textTextStyle: TextStyle(fontFamily: Font.name('b'),color: Colors.black,fontSize: 14),
      confirmBtnText: 'تایید',
      cancelBtnText: 'لغو',
      backgroundColor: AppColor.main.withOpacity(.2),
      onConfirmBtnTap: onSuccess,
      onCancelBtnTap: onCancel,
      confirmBtnTextStyle: TextStyle(fontFamily: Font.name('b'),color: Colors.white),
      cancelBtnTextStyle: TextStyle(fontFamily: Font.name('b'),color: Colors.black),
      confirmBtnColor: AppColor.main,

    );
}