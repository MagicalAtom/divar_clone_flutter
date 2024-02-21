import 'package:flutter/material.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/screens/main/widgets/ad_home_screen_widget.dart';
import 'package:sanjagh/screens/main/widgets/app_bar_widget.dart';
import 'package:sanjagh/screens/main/widgets/category_widget.dart';
import 'package:sanjagh/screens/main/widgets/last_view_widget.dart';
import 'package:sanjagh/screens/main/widgets/slider_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String rotue = "/";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.level3, vertical: AppSize.level2),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const HomeAppBarWidget(),
                  height(20),
                  SliderWidget(pages: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ], height: 200),
                  height(20),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 130,
                            crossAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return CategoryHomeWidget(
                          name: 'سرگرمی و فراغت',
                          icon: const Icon(
                            Iconsax.activity,
                            color: AppColor.main,
                          ));
                    },
                    itemCount: 10,
                  ),
                  height(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'بازدید های اخیر',
                        fontFamily: Font.name('b'),
                        fontSize: Font.size(2),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  height(15),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: const EdgeInsets.all(4),
                            child: LastViewWidget(title: 'لباس'));
                      },
                    ),
                  ),
                  height(10),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  AdHomeWidget(
                      title: 'بادگیر سالم',
                      status: 'در حد نو',
                      image: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                      ),
                      location: 'لحظاتی پیش در ابوطالب',
                      price: '10000'),
                  Divider(
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
