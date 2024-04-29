import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/size_application.dart';

Widget LoadingComponent() {
  return Center(
    child: LoadingAnimationWidget.inkDrop(
        color: AppColor.main, size: AppSize.level5),
  );
}
