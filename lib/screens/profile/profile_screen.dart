import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/screens/intro/splash_screen.dart';
import 'package:sanjagh/screens/profile/config/style_value_config.dart';
import 'package:sanjagh/screens/profile/my-ad_screen.dart';
import 'package:sanjagh/screens/profile/widgets/profile_items_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const route = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: 'سنجاق من',
              fontFamily: Font.name('b'),
              fontSize: Font.size(3),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        'شما با شماره موبایل 09150092123 وارد شده اید و آگهی های\nثبت شده با این شماره را مشاهده میکنید',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: Font.name('m'), fontSize: Font.size(1) + 2,),
                      ),
                    ),
                  )
                ],
              ),
              height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: AppColor.border!.withOpacity(.6)),
                        borderRadius: BorderRadius.circular(AppSize.level7)),
                    child: Center(
                        child: CustomText(
                      text: 'خروج از حساب',
                      fontFamily: Font.name('m'),
                      fontSize: Font.size(2) - 4,
                      color: Colors.grey[500],
                    )),
                  ),
                ],
              ),
              height(10),
              dividerProfile, 
              height(10),
              ProfileItems(
                onTap: (){
                  context.push(MyAdScreen.route);
                },
                  text: 'آگهی های من',
                  icon: const Icon(
                    Icons.ad_units_rounded,
                    size: 30,
                    color: AppColor.main,
                  )),
                   ProfileItems(
                    onTap: (){

                    },
                  text: 'ذخیره شده ها',
                  icon: const Icon(
                    Icons.save,
                    size: 30,
                    color: AppColor.main,
                  )),
                  ProfileItems(
                    onTap: (){

                    },
                  text: 'تنظیمات',
                  icon: const Icon(
                    Icons.settings,
                    size: 30,
                    color: AppColor.main,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
