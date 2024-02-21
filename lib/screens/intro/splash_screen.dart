import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/main/home_screen.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  static String route = '/splash';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      context.go(HomeScreen.rotue);
    });
    return Scaffold(
      backgroundColor: AppColor.main,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: SizeConfig.screenWidth,),
          const Icon(CupertinoIcons.pin,size: 150,color: AppColor.white,),  // @todo متحرک بشه
          height(AppSize.level6),
          CustomText(text: 'سنجاق',fontFamily: Font.name('b'),fontSize: Font.size(7),color: AppColor.white,),
        ],
      ),
    );
  }
}