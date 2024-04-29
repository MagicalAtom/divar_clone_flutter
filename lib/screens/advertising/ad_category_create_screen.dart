import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sanjagh/bloc/category/bloc/category_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/widgets/CacheImage.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/categories/widgets/category_items_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

class AdCategoryListScreen extends StatelessWidget {
  static const String route = "/ad-select-category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: 'دسته بندی ها',
              fontFamily: Font.name('m'),
              fontSize: Font.size(2),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return Center(
                      child: LoadingComponent());
                } else if (state is CategoryRequestState) {
                  return state.categories.fold((failedLoad) {
                    return Center(
                        child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<CategoryBloc>()
                            .add(CategoryRequestEvent());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.main,
                          minimumSize: Size(100, 40)),
                      child: CustomText(
                        text: 'تلاش مجدد',
                        fontFamily: Font.name('b'),
                        color: Colors.white,
                      ),
                    ));
                  }, (successLoad) {
                    return SizedBox(
                      height: SizeConfig.screenHeight! - 100,
                      child: ListView.builder(
                        itemCount: successLoad.length,
                        itemBuilder: (context, index) {
                          return CategoryItemWidget(
                            selectCategory: true,
                            id: successLoad[index].id,
                            name: successLoad[index].name,
                            icon: Container(
                              width: AppSize.level5,
                              height: AppSize.level5,
                              child: CacheImage(
                                  getFullImagePath(successLoad[index].icon),
                                  context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        },
                      ),
                    );
                  });
                }
                return const Text('');
              },
            )
          ],
        ),
      ),
    );
  }
}
