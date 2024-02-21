import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/profile/config/style_value_config.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class NotificationItemWidget extends StatelessWidget {
  NotificationItemWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.lastMessage,
      required this.lastMessageDate,
      });


  Widget image;
  String title;
  String lastMessage;
  String lastMessageDate;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            dividerProfile,
          Row(
            children: [
              CustomText(text: title,fontFamily: Font.name('b'),fontSize: Font.size(2),),
              const Spacer(),
              CustomText(text: lastMessageDate,fontFamily: Font.name('m'),fontSize: Font.size(1) + 3,color: Colors.grey[500],),
            ],
          ),
          height(8),
          CustomText(text: lastMessage,color: Colors.grey[500],fontFamily: Font.name('m'),fontSize: Font.size(1) + 7,size: 500,),
           height(6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: ClipRRect(borderRadius: BorderRadius.circular(10),child: image),
                ),
                const Spacer(),
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: CustomText(text: 'اعلانات',fontFamily: Font.name('m'),fontSize: Font.size(1) + 4,),
                  ),
                )
              ],
            ),
            dividerProfile,
          ],
        ),
      ),
    );
  }




}
