import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';

class BottomNavigationBarItemsWidget {
  String lable;
  Icon icons;
  Icon activeIcon;
  BottomNavigationBarItemsWidget(this.lable, this.icons, this.activeIcon);
}

List<BottomNavigationBarItemsWidget> items = [
  BottomNavigationBarItemsWidget(
    'آگهی ها',
    const Icon(
      CupertinoIcons.pin_fill,
      size: 25,
    ),
    const Icon(
      CupertinoIcons.pin_fill,
      color: AppColor.main,
      size: 25,
    ),
  ),
  BottomNavigationBarItemsWidget(
      'دسته ها',
      const Icon(
        Icons.list,
        size: 25,
      ),
      const Icon(
        Icons.list,
        color: AppColor.main,
        size: 25,
      )),
  BottomNavigationBarItemsWidget(
    '',
    const Icon(
      Icons.abc,
      size: 35,
      color: Colors.white,
    ),
    const Icon(
      Iconsax.add,

      color:Colors.white,
      size: 35,
    ),
  ),
  BottomNavigationBarItemsWidget(
    'چت',
    const Icon(
      CupertinoIcons.chat_bubble_2_fill,
      size: 25,
    ),
    const Icon(
      CupertinoIcons.chat_bubble_2_fill,
      color: AppColor.main,
      size: 25,
    ),
  ),
  BottomNavigationBarItemsWidget(
    'دیوار من',
    const Icon(
      CupertinoIcons.profile_circled,
      size: 25,
    ),
    const Icon(
      CupertinoIcons.profile_circled,
      color: AppColor.main,
      size: 25,
    ),
  ),
];
