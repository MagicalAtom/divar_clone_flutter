// select Province
// بعد از انتخاب یک استان که آیدی به غیر از 0 داشته باشه باید داخل بلاک بیلدر بیاد و کامپوننت انتخاب شهر رو نشون بده . کاملا داینامیک

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanjagh/configs/app_data.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/province/cubit/province_cubit.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/new-ad_screen.dart';
import 'package:sanjagh/screens/advertising/widgets/new_ad_screen_widgets/select_city_component.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class SelectProvince extends StatelessWidget {
  SelectProvince({
    super.key,
    required this.widget,
  });


  NewAdScreen widget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProvinceCubit>.value(
      value: ServiceLocator.get<ProvinceCubit>(),
      child: Column(
        children: [
          height(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                text: 'انتخاب استان',
                fontFamily: Font.name('b'),
                fontSize: 16.0,
              ),
            ],
          ),
          height(10),
          // this
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 70.0,
              decoration: BoxDecoration(
                border:
                    Border.all(width: .75, color: Colors.black.withOpacity(.7)),
                borderRadius: BorderRadius.circular(AppSize.level1),
              ),
              child: DropdownButtonHideUnderline(
                  child: BlocBuilder<ProvinceCubit, int>(
                builder: (context, state) {
                        return DropdownButton(
                        alignment: AlignmentDirectional.bottomEnd,
                        isDense: true,
                        isExpanded: true,
                        iconSize: 30,
                        value: state,
                        onChanged: (value) {
                          context.read<ProvinceCubit>().changeProvince(value);
                          widget.adController.province = value.toString();
                        },
                        selectedItemBuilder: (context) {
                          if (widget.adController.province.isEmpty) {
                            return [];
                          }else{
                            return List.generate(iran.Provinces.length, (index) => _showTitle(title:iran.Provinces[index].name));
                          }
                        },
                        items:_generateItems(state),
                        );
                },
              ) // your Dropdown Widget here
                  ),
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>>? _generateItems(state){
    return List.generate(iran.Provinces.length, (index) => ProvincesItems(state: state, value: int.parse(iran.Provinces[index].id), text:iran.Provinces[index].name));
  }

  DropdownMenuItem<int> ProvincesItems({required int state,required int value,required String text}) {
    return DropdownMenuItem(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text,
                            style: TextStyle(
                              color: AppColor.black.withOpacity(.7),
                            fontFamily: Font.name('b'),
                            ),
                          ),
                          state == value
                              ? Icon(Icons.check_box_outlined)
                              : Icon(Icons.check_box_outline_blank),
                        ],
                      ),
                      value: value,
                    );
  }

  Widget _showTitle({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: AppColor.black.withOpacity(.7),
          fontFamily: Font.name('b'),
        ),
      ],
    );
  }
}
