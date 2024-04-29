import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';

class SearchInputWidget extends StatelessWidget {
  SearchInputWidget({super.key,required this.onChanged,required this.controller});
  void Function(String)? onChanged;
  TextEditingController controller;
  


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.border!, width: 1),
          borderRadius: BorderRadius.circular(AppSize.level1)),
      margin: const EdgeInsets.all(5),
      child: TextField(
        textDirection: TextDirection.rtl,
        style: TextStyle(
           fontFamily: Font.name('m'),
                    fontSize: 20,
                    color: Colors.grey[700],
        ),
        onChanged: onChanged,
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          suffixIcon: Icon(
                    Iconsax.search_normal,
                    color: Colors.grey[800],
                  ),
                  prefix: GestureDetector(
                    child: const Text('X'),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
          border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'جستجو در همه آگهی ها',
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
                fontFamily: Font.name('m'),
                    fontSize: Font.size(2) - 2,
                    color: Colors.grey[700],
            )
        ),
      )
    );
  }
}