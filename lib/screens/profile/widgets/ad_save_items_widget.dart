import 'package:flutter/material.dart';

import '../../../configs/fonts_application.dart';
import '../../../configs/size_application.dart';
import '../../../widgets/custom_text_widget.dart';
import '../../../widgets/height_widget.dart';

class AdSaveItemsWidget extends StatelessWidget {
   AdSaveItemsWidget({super.key,required this.image,required this.title,required this.location,required this.price,required this.status});
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
                child: ClipRRect(borderRadius: BorderRadius.circular(AppSize.level1),child: image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}