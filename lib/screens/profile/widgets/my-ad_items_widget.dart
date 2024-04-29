import 'package:flutter/material.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/screens/profile/components/my-ad_screen_button_component.dart';
import 'package:sanjagh/screens/profile/config/style_value_config.dart';
import 'package:sanjagh/widgets/width_widget.dart';

import '../../../configs/fonts_application.dart';
import '../../../configs/size_application.dart';
import '../../../widgets/custom_text_widget.dart';
import '../../../widgets/height_widget.dart';




class MyAdItemWidget extends StatelessWidget {
  MyAdItemWidget({super.key,required this.title,required this.image,required this.time,required this.onDeleteButton,required this.location});

  String title;
  String time;
  String location;
  Widget image;
  VoidCallback onDeleteButton;



  @override
  Widget build(BuildContext context) {
  return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          dividerProfile,
          Container(
            padding: const EdgeInsets.all(8),
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: title,fontFamily: Font.name('b'),fontSize: Font.size(2),size: 100,),
                          InkWell(
                            onTap: onDeleteButton,
                            child: Icon(Icons.delete,color: AppColor.main,size: 30,),
                          )
                        ],
                      ),
                      height(15),
                      CustomText(text: time,fontFamily: Font.name('m'),fontSize: Font.size(1) + 6,color: Colors.grey[800],),
                      height(15),
                      CustomText(text: location,fontFamily: Font.name('m'),fontSize: Font.size(1) + 6,color: Colors.grey[800],),
                      height(15),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.level1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.level1),
                      child: image,
                      ),
                  ),
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
    
  }

}