import 'package:flutter/material.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/data/dummy/dummy_chat_data.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/chat/widgets/menu_button_chat_detail_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _chatTextFieldSection(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Directionality(textDirection: TextDirection.rtl,child: _ChatDetailWidget()),
        ),
        actions: 
           [
            PopupMenuButtonChatItemWidget()
          ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
            text: 'فروشگاه پونه',
            fontFamily: Font.name('m'),
            fontSize: Font.size(2),
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return _MessageWidget(messages[index]['message'],messages[index]['date'], messages[index]['yourOwnMessage']);
          },
        )
      ),
    );
  }

// Widget section

  Widget _chatTextFieldSection() {
    return Container(
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[600]!,
          width: .4 
        ),
        color: Colors.grey[200]
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Icon(Icons.mic,color: Colors.black.withOpacity(.6),size: 24,),
            width(10),
            const Expanded(
              child: TextField(
                minLines: 1,
                maxLines: 2000,
                textAlignVertical: TextAlignVertical.center,
                scrollPadding: EdgeInsets.symmetric(vertical: 12),
                decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15,right: 10),                    
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26,width: .9)
                  )
                ),
              ),
            ),
            width(10),
            const Icon(Icons.send,color: AppColor.main,size: 30,),
          ],
        ),
      ),
    );
  }

  Widget _MessageWidget(String message,String time,bool isOwn){
    double message_width = SizeConfig.screenHeight! * .9;
    return Row(
      mainAxisAlignment: isOwn ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isOwn ? Colors.blue.shade100 : Colors.grey.shade100,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(AppSize.level1),
              topRight: const Radius.circular(AppSize.level1),
              bottomLeft: isOwn ? const Radius.circular(AppSize.level1) : const Radius.circular(1),
              bottomRight: isOwn ? const Radius.circular(1) : const Radius.circular(AppSize.level1), 
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Container(
                      width: message_width * .3,
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        message,
                        softWrap: true,
                      style: TextStyle(
                        fontFamily: Font.name('m'),fontSize: Font.size(1) + 4,
                      ),),
                    ),
                    height(8),
                    CustomText(text: time,fontFamily: Font.name('m'),fontSize: Font.size(1) + 4,color: Colors.grey[700],),

                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }



  Widget _ChatDetailWidget() {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: AppColor.grey!.withOpacity(.7),
            height: 70,
            width: SizeConfig.screenWidth,
            child: Row(
              children: [
                // @todo set image and title
                Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                ),
                width(10),
                CustomText(text: 'فروش خانه نزدیک حرم',fontFamily: Font.name('m'),fontSize: Font.size(1) + 5,)
              ],
            ),
          );
  }
}