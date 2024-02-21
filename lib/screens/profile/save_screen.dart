import 'package:flutter/material.dart';
import 'package:sanjagh/components/app_bar_component.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/screens/profile/config/style_value_config.dart';
import 'package:sanjagh/screens/profile/widgets/ad_save_items_widget.dart';

class AdSaveScreen extends StatelessWidget {
   AdSaveScreen({super.key});
   static const route = '/save-ad';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('ذخیره شده ها'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.level1,vertical: AppSize.level1 - 4),
        child: Column(
          children: [
            dividerProfile,
            AdSaveItemsWidget(image: Container(color: Colors.red,), title: 'گادپوری', location: 'زعفرانیه', price: '100000', status: 'در حد نو'),
            dividerProfile,
          ],
        ),
      ),
    );
  }
}