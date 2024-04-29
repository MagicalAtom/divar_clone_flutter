import 'package:flutter/material.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/screens/chat/chat_detail_screen.dart';
import 'package:sanjagh/screens/chat/widgets/chat_item_widget.dart';
import 'package:sanjagh/screens/chat/widgets/notification_item_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});
  static const route = '/chats';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: 'چت سنجاق',
              fontFamily: Font.name('m'),
              fontSize: Font.size(3),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  NotificationItemWidget(image: Container(color: Colors.green,), title: 'اعلانات سنجاق', lastMessage: 'آگهی شما ثبت شد', lastMessageDate: 'دوشنبه'),
                  ChatItemWidget(adImage: Container(color: Colors.red,), adTitle: 'طراحی وبسایت', isSeen: true, lastMessage: 'با شرکا صحبت میکنم در صورت قبول کردنشون حتما مزاحمتون میشیم برای عقد قرارداد رسمی . ممنون برای همه چیز', lastMessageDate: 'دوشنبه', userName: 'فروشگاه امیری',yourOwnMessage: true,onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return const ChatDetailScreen();
                    }));
                  },)
                ],
              ),
            )),
      ),
    );
  }
}
