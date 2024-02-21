import 'package:flutter/material.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration:
          BoxDecoration(border: Border.all(color: AppColor.border!, width: 1),borderRadius: BorderRadius.circular(AppSize.level1)),
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          height(40),
          Expanded(
              flex: 3,
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Icon(
                      Iconsax.search_normal,
                      color: Colors.grey[800],
                    ),
                    width(8),
                    CustomText(
                      text: 'جستجو در همه آگهی ها',
                      fontFamily: Font.name('m'),
                      fontSize: Font.size(2) - 2,
                      color: Colors.grey[700],
                    )
                  ],
                ),
              )),
          Container(
            width: 2,
            height: 40,
            color: AppColor.grey,
            margin: const EdgeInsets.symmetric(vertical: 5),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    height(40),
                    width(7),
                    CustomText(
                      text: 'مشهد',
                      fontFamily: Font.name('m'),
                      fontSize: Font.size(2) - 5,
                      color: Colors.black,
                    ),
                    width(5),
                    Icon(
                      Iconsax.location,
                      color: Colors.grey[800],
                      size: 20,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
