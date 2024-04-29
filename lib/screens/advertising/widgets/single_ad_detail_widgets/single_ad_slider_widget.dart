
import 'package:flutter/material.dart';
import 'package:sanjagh/configs/app_url.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/data/models/Ad.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/widgets/CacheImage.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Single_ad_app_bar_Slider extends StatelessWidget {
  const Single_ad_app_bar_Slider({
    super.key,
    required this.ad,
    required this.pageController,
  });

  final Ad ad;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      stretch: true,
      expandedHeight: 200,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
              text: ad.name,
              fontFamily: Font.name('m'),
              fontSize: Font.size(2)),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
          background: SizedBox(
        width: SizeConfig.screenWidth,
        child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
            PageView.builder(
              controller: pageController,
              itemCount: ad.gallery.length,
              itemBuilder: (context, index) {
                return CacheImage('${AppUrl.get}/${ad.gallery[index].path}',context);
              },
            ),
          Positioned(
            bottom: 10,
            child: SmoothPageIndicator(
              controller: pageController,
              count: ad.gallery.length,
              effect:  WormEffect(
                dotWidth: 15,
                dotHeight: 15,
                dotColor: (Colors.grey[300])!,
                activeDotColor: AppColor.main,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[400]!.withOpacity(.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: ad.gallery.length.toString(),
                    fontFamily: Font.name('b'),
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                  width(3),
                  Icon(Icons.games_rounded,size: 18,color: Colors.white,)
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}