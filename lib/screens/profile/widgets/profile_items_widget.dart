import 'package:flutter/material.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/screens/profile/config/style_value_config.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';

class ProfileItems extends StatelessWidget {
  ProfileItems({super.key,required this.text,required this.icon,required this.onTap});
  String text;
  Icon icon;
  VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dividerProfile,
              Row(
                children: [
                icon,
                width(15),
                CustomText(text: text,fontFamily: Font.name('m'),fontSize: Font.size(2),color: Colors.grey[600],),
                const Spacer(),
                 Icon(Icons.chevron_right,size: 30,color: Colors.grey[600],),
                ],
              ),
              height(5),
              dividerProfile,
              ],
          ),
        ),
      ),
    );
  }
}