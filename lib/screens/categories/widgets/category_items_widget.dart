import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget({super.key,required this.name,required this.icon});

  Icon icon;
  String name;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.grey),
        borderRadius: BorderRadius.circular(AppSize.level1)
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            icon,
            width(5),
            CustomText(text: name,fontFamily: Font.name('b'),fontSize: Font.size(1) + 5,),
            const Spacer(),
            const Icon(Icons.chevron_right,size: AppSize.level4,color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}