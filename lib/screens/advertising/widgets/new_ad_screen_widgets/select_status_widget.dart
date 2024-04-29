import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/statusAd/cubit/status_ad_cubit.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/new-ad_screen.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class SelectStatus extends StatelessWidget {
  SelectStatus({
    super.key,
    required this.widget,
  });


  NewAdScreen widget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatusAdCubit(),
      child: Column(
        children: [
          height(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                text: 'وضعیت جنس',
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
                  child: BlocBuilder<StatusAdCubit, int>(
                builder: (context, state) {
                  return DropdownButton(
                    alignment: AlignmentDirectional.bottomEnd,
                    isDense: true,
                    isExpanded: true,
                    iconSize: 30,
                    value: state,
                    onChanged: (value) {
                      context.read<StatusAdCubit>().changeIndex(value);
                      widget.adController.status = changeStatusNumber(value);
                    },
                    selectedItemBuilder: (context) {
                      return [
                        _showTitle(title: 'نو'),
                        _showTitle(title: 'در حد نو'),
                        _showTitle(title: 'نیاز به تعمیر'),
                      ];
                    },
                    items: [
                      StatusItems(state: state,value: 1,text: 'نو'),
                      StatusItems(state: state,value: 2,text: 'در حد نو'),
                      StatusItems(state: state,value: 3,text: 'نیاز به تعمیر'),
                     
                    ],
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

  DropdownMenuItem<int> StatusItems({required int state,required int value,required String text}) {
    return DropdownMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: text,
                            color: AppColor.black.withOpacity(.7),
                            fontFamily: Font.name('b'),
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
