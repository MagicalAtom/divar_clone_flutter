import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class RenameBoxComponent extends StatelessWidget {
  const RenameBoxComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(text: 'ویرایش نام در گفتگو',fontFamily: Font.name('m'),fontSize: Font.size(1) + 8,),
            ],
          ),
          height(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex:5,child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.level1))
                  ),
                   focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.main,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.level1))
                  )
                ),
              )),
              width(20),
              Expanded(flex: 1,child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(AppSize.level1)
                ),height: 50,
                child: Center(
                child: CustomText(
                  text: 'ثبت',
                  fontFamily: Font.name('b'),
                  fontSize: Font.size(1) + 6,
                  color: Colors.white,
                ),
              ),)),
              width(10),
            ],
          ),
          height(20),
        ],
      ),
    );
  }
}