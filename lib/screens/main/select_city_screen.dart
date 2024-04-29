import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/controllers/CityController.dart';
import 'package:sanjagh/data/models/Province.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/main/widgets/accordion_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class SelectCityScreen extends StatelessWidget {
   SelectCityScreen({super.key});
   static const String route = '/select-city';
   List<Province> provinces = CityController().getProvince();
  @override
  Widget build(BuildContext context) {
  PagingController pagingController = GoRouterState.of(context).extra! as PagingController;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.background,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(text: 'انتخاب شهر',fontFamily: Font.name('b'),),
              ],
            )
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: provinces.length,
              itemBuilder: (context, index) {
                return AccordionWidgtet(title: provinces[index].name,province_id: provinces[index].id,pagingController: pagingController,);
              },
              separatorBuilder: (context, index) {
                return height(10);
              },
            ),
          ),
    );
  }
}