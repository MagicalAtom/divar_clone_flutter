import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/category/cubit/category_cubit.dart';
import 'package:sanjagh/screens/advertising/ad_category_create_screen.dart';
import 'package:sanjagh/screens/advertising/new-ad_screen.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';
class SelectCategory extends StatelessWidget {
  const SelectCategory({
    super.key,
    required this.widget,
  });

  final NewAdScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: 'دسته بندی آگهی',
              fontFamily: Font.name('b'),
              fontSize: 16.0,
              color: AppColor.black,
            ),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            context.push(AdCategoryListScreen.route);
          },
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppSize.level1),
              border:
                  Border.all(width: 1, color: AppColor.black),
            ),
            child:
                BlocBuilder<CategoryCubit, CategoryStateCubit>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return LoadingComponent();
                } else if (state is CategoryUpdate) {
                  widget.adController.selectedCategoryId =
                      state.id;
                  return Row(
                    children: [
                      width(10),
                      const Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                      const Spacer(),
                      CustomText(
                        text: state.name == ''
                            ? 'انتخاب دسته بندی'
                            : state.name,
                        fontFamily: Font.name('b'),
                        fontSize: Font.size(2),
                      ),
                      width(20),
                    ],
                  );
                }
                return const Text('');
              },
            ),
          ),
        ),
      ],
    );
  }
}