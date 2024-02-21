import 'package:flutter/material.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/screens/categories/widgets/category_items_widget.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(text: 'دسته بندی ها',fontFamily: Font.name('m'),fontSize: Font.size(2),),
          ],
        ),
      ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
      child: Column(
        children: [
          CategoryItemWidget(name: 'خانه اجاره ای', icon: const Icon(Icons.home,color: AppColor.main,size: AppSize.level4,)),
        ],
      ),
    ),
    );
  }
}