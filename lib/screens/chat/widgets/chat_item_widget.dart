import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/profile/config/style_value_config.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class ChatItemWidget extends StatelessWidget {
  ChatItemWidget(
      {super.key,
      required this.adImage,
      required this.adTitle,
       this.isSeen = false,
      required this.lastMessage,
      this.yourOwnMessage = false,
      required this.lastMessageDate,
      required this.userName,
      required this.onTap,
      });

  VoidCallback onTap;
  bool yourOwnMessage;
  String userName;
  Widget adImage;
  String adTitle;
  String lastMessage;
  String lastMessageDate;
  bool isSeen; // The last message, if sent by you, has been seen by the recipient or not


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              dividerProfile,
            Row(
              children: [
                CustomText(text: userName,fontFamily: Font.name('b'),fontSize: Font.size(2),),
                const Spacer(),
                doubleCheckMessage(),
                width(3),
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
                    child: ClipRRect(borderRadius: BorderRadius.circular(10),child: adImage),
                  ),
                  width(10),
                  CustomText(text: adTitle,fontSize: Font.size(1) + 6,fontFamily: Font.name('m'),),
                  const Spacer(),
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: CustomText(text: 'آگهی',fontFamily: Font.name('m'),fontSize: Font.size(1) + 4,),
                    ),
                  )
                ],
              ),
              dividerProfile,
            ],
          ),
        ),
      ),
    );
  }


 Widget doubleCheckMessage(){
    if(yourOwnMessage && isSeen){
      return Stack(
        children: [
          Icon(Icons.check,color: Colors.green[700],),
          Positioned(left: 6,child: Icon(Icons.check,color: Colors.green[700],))
        ],
      );
    }else{
         return Icon(Icons.check,color: Colors.green[700],);
    }
  }




}
