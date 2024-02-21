import 'package:flutter/material.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class AdHomeWidget extends StatelessWidget {
   AdHomeWidget({super.key,required this.title,required this.status,required this.image,required this.location,required this.price});

  String title;
  String status;
  String price;
  String location;
  Widget image;



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: title,fontFamily: Font.name('b'),fontSize: Font.size(2),size: 100,),
                  height(20),
                  CustomText(text: status,fontFamily: Font.name('m'),fontSize: Font.size(1) + 8,color: Colors.grey[800],),
                  height(5),
                  CustomText(text: price,fontFamily: Font.name('m'),fontSize: Font.size(1) + 8,color: Colors.grey[800],),
                  height(5),
                  CustomText(text: location,fontFamily: Font.name('m'),fontSize: Font.size(1) + 6,color: Colors.grey[800],),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.level1)
                ),
                child: ClipRRect(child: image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}