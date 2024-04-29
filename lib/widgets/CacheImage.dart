import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/size_application.dart';

CacheImage(ImageUrl,BuildContext context){
  return CachedNetworkImage(
    imageUrl: ImageUrl,
    placeholder: (context,url) => LoadingAnimationWidget.fallingDot(color: AppColor.main, size: AppSize.level3),
  );
}