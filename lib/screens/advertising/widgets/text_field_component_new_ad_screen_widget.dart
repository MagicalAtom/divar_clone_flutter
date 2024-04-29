import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/helpers/saveFormValue.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({super.key,required this.name,required this.controller,this.isBigTextField = false,required this.placeholder,required this.textInputFormatter,required this.title,required this.validator});
  String title;
  final validator;
  String placeholder;
  bool isBigTextField;
  String name;
  TextEditingController controller;
  List<TextInputFormatter> textInputFormatter;
  
  SaveFormValue saveFormValue = ServiceLocator.get(); // saving user input

  @override
  Widget build(BuildContext context) {
    controller.text = saveFormValue.getFormValue(name);
                     return Column(
                      children: [
                        height(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: title,
                              fontFamily: Font.name('b'),
                              fontSize: 16.0,
                              color: AppColor.black,
                            ),
          
                          ],
                        ),
                        height(10),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                          style: TextStyle(fontFamily: Font.name('b')),
                            onChanged: (value) {
                              saveFormValue.saveFormValue(name, value);
                            },
                            controller: controller,
                            maxLines: isBigTextField ? 12 : 1,
                            inputFormatters: textInputFormatter,
                            decoration: InputDecoration(
                            
                                hintText: placeholder,
                                hintStyle: TextStyle(
                                  fontFamily: Font.name('m'),
                                ),
                                
                                hintTextDirection: TextDirection.rtl,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppSize.level1))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColor.main,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppSize.level1)))),
                            validator: validator
                          ),
                        ),
                        height(5),
                      ],
                    );
  }
}