import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/components/alert_dialog_component.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/libs/Translator.dart';
import 'package:sanjagh/screens/advertising/widgets/single_ad_detail_widgets/single_ad_slider_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:sanjagh/data/models/Ad.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/profile/config/style_value_config.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class SingleAdDetail extends StatelessWidget {
  SingleAdDetail({super.key});
  double message_width = SizeConfig.screenHeight! * .9;
  static const route = '/single-add';
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('fa',Translator());
    Ad ad = GoRouterState.of(context).extra! as Ad;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {

         await AlertDialogComponent(context: context, title: 'راه های ارتباطی', sub_title: '', description: 'شماره موبایل آگهی دهنده : ${ad.phone}');

              },
              child: Container(
                width: 160,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColor.main,
                  borderRadius: BorderRadius.circular(AppSize.level1)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'اطلاعات تماس',fontFamily: Font.name('b'),color: Colors.white,fontSize: Font.size(2),),
                    width(5),
                    const Icon(Icons.call,color: Colors.white,),
                  ],
                ),
              ),
            ),
            width(20),
               Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.main,
                borderRadius: BorderRadius.circular(AppSize.level1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: 'گفت و گو',fontFamily: Font.name('b'),color: Colors.white,fontSize: Font.size(2),),
                  width(5),
                  const Icon(CupertinoIcons.chat_bubble,color: Colors.white,),
                ],
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          Single_ad_app_bar_Slider(ad: ad, pageController: pageController),
          SliverToBoxAdapter(child: height(30)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.level2),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    text: ad.name,
                    fontFamily: Font.name('b'),
                    fontSize: 18.0,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: height(10)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.level2),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  width(5),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: CustomText(
                      text: timeago.format(DateTime.tryParse(ad.created_at.toString())!,locale: 'fa'),
                      fontFamily: Font.name('m'),
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: height(20)),

          _single_ad_item_widget(ad.price,'قیمت',false),
          _single_ad_item_widget(ad.status,'وضعیت',false),
          _single_ad_item_widget(ad.city,'شهر',false,),
          _single_ad_item_widget('نمایش آدرس','آدرس آگهی',true,onTap: () async {
         await AlertDialogComponent(context: context, title: 'آدرس', sub_title: 'آدرس ثبت شده برای آگهی', description: ad.map);
          }),


          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.level2),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  width(10),
                  CustomText(
                    text: 'توضیحات',
                    fontFamily: Font.name('m'),
                    fontSize: Font.size(2),
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: height(5),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.level2),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  width(10),
                  Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: message_width * .5,
                                child: Text(
                                  ad.description,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontFamily: Font.name('m'),
                                    fontSize: Font.size(1) + 4,
                                  ),
                                ),
                              ),
                              height(8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: dividerProfile,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Iconsax.like),
                  const Icon(Iconsax.dislike),
                  width(10),
                  CustomText(text: 'بازخورد شما درباره این آگهی چیست ؟',fontFamily: Font.name('b'),fontSize: Font.size(1) + 5,),  
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: dividerProfile,
          ),
            SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(text: 'گزارش کلاهبرداری و رفتار مشکوک',fontFamily: Font.name('b'),fontSize: Font.size(1) + 6,),  
                  const Icon(Icons.dangerous_outlined),
                ],
              ),
            ),
          ),
          const SliverPadding(padding:  EdgeInsets.all(45))
        ],
      ),
    );
  }

  SliverToBoxAdapter _single_ad_item_widget(String value,String title,bool showDialog,{VoidCallback? onTap}) {
    return SliverToBoxAdapter(
          child: Column(
            children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.level2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                width(10),
                showDialog ? GestureDetector(
                  onTap:onTap,
                  child: CustomText(
                    text: value,
                    fontFamily: Font.name('m'),
                    fontSize: 17.0,
                    color: Colors.blue,
                  ),
                ) : CustomText(
                  text: value,
                  fontFamily: Font.name('m'),
                  fontSize: 17.0,
                  color:Colors.grey[700],
                ),
                const Spacer(),
                CustomText(
                  text: title,
                  fontFamily: Font.name('m'),
                  fontSize: 17.0,
                  color: Colors.grey[700],
                ),
                width(10),
              ],
            ),
          ),
          height(10),
          Divider(),
          height(10),
            ],
          ),
        );
  }
}

