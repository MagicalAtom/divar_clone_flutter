import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/theme/cubit/change_theme_cubit.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class ChangeThemeComponent extends StatelessWidget {
  const ChangeThemeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: 'تغییر تم برنامه',
                fontFamily: Font.name('m'),
                fontSize: Font.size(1) + 8,
              ),
            ],
          ),
          height(20),
          BlocBuilder<ChangeThemeCubit,ChangeThemeState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 70,
                decoration: const BoxDecoration(
                    color: AppColor.main,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.level2))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          context.read<ChangeThemeCubit>().chnageTheme();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: (state is ChangeThemeLight) ? Colors.white : Colors.transparent
                          ),
                          height: 70,
                          child: Center(
                              child: CustomText(
                            text: 'روز',
                            fontFamily: Font.name('b'),
                            fontSize: Font.size(2),
                            color: (state is ChangeThemeLight) ? Colors.black : Colors.white
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          context.read<ChangeThemeCubit>().chnageTheme();
                        },
                        child: Container(
                           decoration: BoxDecoration(
                            color: (state is ChangeThemeDark) ? Colors.white : Colors.transparent
                          ),
                          height: 70,
                          child: Center(
                              child: CustomText(
                            text: 'شب',
                            fontFamily: Font.name('b'),
                            fontSize: Font.size(2),
                            color: (state is ChangeThemeDark) ? Colors.black : Colors.white,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
