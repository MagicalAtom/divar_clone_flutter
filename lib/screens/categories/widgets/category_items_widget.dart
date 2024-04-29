import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanjagh/bloc/ad/bloc/ad_bloc.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/cubit/category/cubit/category_cubit.dart';
import 'package:sanjagh/cubit/last_category/cubit/last_category_cubit.dart';
import 'package:sanjagh/helpers/saveFormValue.dart';
import 'package:sanjagh/screens/advertising/ad_list_screen.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget(
      {super.key,
      required this.selectCategory,
      required this.id,
      required this.name,
      required this.icon});

  Widget icon;
  String name;
  String id;
  bool selectCategory;
  SaveFormValue saveFormValue = ServiceLocator.get();
  static const categoryName = 'name';
  static const categoryId = 'id';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory
          ? () {
              // select category in new ad
              context.read<CategoryCubit>().setItem(id, name);
              context.pop();
            }
          : () {
              // select category in category list , show ad belongs category
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                  create: (context) => AdBloc(ServiceLocator.get()),
                    ),
                    BlocProvider(
                  create: (context) => LastCategoryCubit(ServiceLocator.get()),
                    )
                  ],
                  child: AdListScreen(
                    category_id: int.parse(id),
                    category_name: name,
                  ),
                );
              }));
            },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1.6, color: Colors.grey),
            borderRadius: BorderRadius.circular(AppSize.level1)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              icon,
              width(10),
              CustomText(
                text: name,
                fontFamily: Font.name('b'),
                fontSize: Font.size(1) + 5,
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right,
                size: AppSize.level4,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
