// select Province
// بعد از انتخاب یک استان که آیدی به غیر از 0 داشته باشه باید داخل بلاک بیلدر بیاد و کامپوننت انتخاب شهر رو نشون بده . کاملا داینامیک

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanjagh/configs/app_data.dart';
import 'package:sanjagh/configs/app_key.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/city/cubit/city_cubit.dart';
import 'package:sanjagh/cubit/province/cubit/province_cubit.dart';
import 'package:sanjagh/data/models/City.dart';
import 'package:sanjagh/helpers/saveFormValue.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/new-ad_screen.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class SelectCity extends StatelessWidget {
  SelectCity({
    super.key,
    required this.widget,
    required this.cities,
    required this.saveFormValue
  });

  NewAdScreen widget;
  List<City> cities = [];
  SaveFormValue saveFormValue;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProvinceCubit()),
        BlocProvider(create: (context) => CityCubit()),
      ],
      child: Column(
        children: [
          height(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                text: 'انتخاب شهر',
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
                border: Border.all(
                    width: .75, color: Colors.black.withOpacity(.7)),
                borderRadius: BorderRadius.circular(AppSize.level1),
              ),
              child: DropdownButtonHideUnderline(
                  child: BlocBuilder<CityCubit, int>(
                builder: (context, state) {
                  return DropdownButton(
                    alignment: AlignmentDirectional.bottomEnd,
                    isDense: true,
                    isExpanded: true,
                    iconSize: 30,
                    value: state,
                    onChanged: (value) {
      context.read<CityCubit>().changeCity(value);
      widget.adController.city = cities.elementAt(value!).name;
    },
                    selectedItemBuilder: (context) {
                        return List.generate(
                            cities.length,
                            (index) => _showTitle(
                                title: cities[index].name));
                    },
                    items: _generateItems(state),
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


  List<DropdownMenuItem<int>>? _generateItems(state) {
    return List.generate(
        cities.length,
        (index) => CityItems(
            state: state,
            value: index,
            text: cities[index].name));
  }

  DropdownMenuItem<int> CityItems(
      {required int state, required int value, required String text}) {
    return DropdownMenuItem(
      value: value,
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
              ? const Icon(Icons.check_box_outlined)
              : const Icon(Icons.check_box_outline_blank),
        ],
      ),
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
