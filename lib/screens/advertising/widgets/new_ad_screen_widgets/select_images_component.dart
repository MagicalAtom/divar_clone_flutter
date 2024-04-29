import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/components/snack_bar.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/libs/image_selector.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/screens/advertising/new-ad_screen.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';
import 'package:sanjagh/widgets/width_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectImages extends StatelessWidget {
  const SelectImages({
    super.key,
    required this.widget,
  });

  final NewAdScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: CustomText(
                      text: 'انتخاب عکس',
                      fontFamily: Font.name('b'),
                    ),
                    content: SizedBox(
                      height: 200,
                      width: SizeConfig.screenWidth,
                      child: Stack(
                        children: [
                          Container(width: double.infinity,),
                          widget.adController.selectedFile.isNotEmpty
                              ? PageView.builder(
                                  controller:
                                      widget.adController.pageController,
                                  itemCount:
                                      widget.adController.selectedFile.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      width: SizeConfig.screenWidth,
                                      child: Image.file(File(widget.adController
                                          .selectedFile[index].path)),
                                    );
                                  },
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                    ),
                                    Image.asset('assets/image/not-found.png'),
                                    height(10),
                                    CustomText(
                                      text: 'عکسی انتخاب نشده است',
                                      fontFamily: Font.name('b'),
                                    )
                                  ],
                                ),
                          widget.adController.selectedFile.isNotEmpty
                              ? Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: SmoothPageIndicator(
                                    controller:
                                        widget.adController.pageController,
                                    count:
                                        widget.adController.selectedFile.length,
                                    effect: const JumpingDotEffect(
                                        activeDotColor: AppColor.main,
                                        dotHeight: 10,
                                        dotWidth: 10),
                                  ),
                                )
                              : Container(),
                          widget.adController.selectedFile.isNotEmpty
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                          onTap: () {
                                            widget.adController.selectedFile
                                                .removeAt(widget.adController
                                                    .pageController.page!
                                                    .toInt());
                                            setState(() {});
                                          },
                                          child: const Icon(Icons.close)),
                                    ),
                                    width(20),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                          onTap: () async {
                                            CroppedFile? croppedFile =
                                                await ImageCropper().cropImage(
                                              sourcePath: widget
                                                  .adController
                                                  .selectedFile[widget
                                                      .adController.pageController.page!
                                                      .toInt()]
                                                  .path,
                                              aspectRatioPresets: [
                                                CropAspectRatioPreset.square,
                                                CropAspectRatioPreset.ratio5x3,
                                                CropAspectRatioPreset.ratio3x2,
                                                CropAspectRatioPreset.original,
                                                CropAspectRatioPreset.ratio4x3,
                                                CropAspectRatioPreset.ratio16x9
                                              ],
                                              uiSettings: [
                                                AndroidUiSettings(
                                                    toolbarTitle: 'ویرایش عکس',
                                                    toolbarColor: AppColor.main,
                                                    toolbarWidgetColor: Colors.white,
                                                    initAspectRatio:
                                                        CropAspectRatioPreset.original,
                                                    showCropGrid: true,
                                                    lockAspectRatio: false),
                                              ],
                                            );
                                            if (croppedFile != null) {
                                              widget.adController.selectedFile[widget
                                                  .adController.pageController.page!
                                                  .toInt()] = XFile(croppedFile.path);
                                              setState(() {
                                                
                                              },);
                                            }
                                          },
                                          child: Icon(Icons.edit)),
                                    ),
                                ],
                              )
                              : Container(),
                          
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: CustomText(
                          text: widget.adController.selectedFile.isNotEmpty
                              ? 'تایید'
                              : 'بستن',
                          color: Colors.black,
                          fontFamily: Font.name('b'),
                          fontSize: 15.0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (widget.adController.selectedFile.isNotEmpty) {
                            if (widget.adController.selectedFile.length != 5) {
                              final selects = await selectImages();
                              if (selects.length +
                                      widget.adController.selectedFile.length >
                                  5) {
                                showMessage('تعداد مجاز آپلود عکس 5 عدد میباشد',
                                    context);
                              } else {
                                selects.forEach((element) {
                                  widget.adController.selectedFile.add(element);
                                });
                              }
                            }
                            showMessage(
                                'تعداد مجاز آپلود عکس 5 عدد میباشد', context);
                          } else {
                            widget.adController.selectedFile =
                                await selectImages();
                          }
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.main),
                        child: CustomText(
                          text: 'انتخاب عکس',
                          color: Colors.white,
                          fontFamily: Font.name('b'),
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  );
                },
              );
            });
      },
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [10, 10],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
              ),
              CustomText(
                text: 'عکس های آگهی',
                fontFamily: Font.name('b'),
              ),
              height(10),
              const Icon(Iconsax.image)
            ],
          )),
    ));
  }
}
