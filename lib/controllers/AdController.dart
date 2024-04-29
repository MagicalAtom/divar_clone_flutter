import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanjagh/components/map_component.dart';
import 'package:sanjagh/configs/app_data.dart';
import 'package:sanjagh/data/models/City.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/helpers/saveFormValue.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';

class AdController {
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController description = TextEditingController();
  SaveFormValue saveFormValue = ServiceLocator.get();
  PageController pageController = PageController();
  String saveStatusItem = 'نو';
  List<XFile> selectedFile = [];
  String selectedCategoryId = '';
  String? location;
  String status = changeStatusNumber(0);
  String city = '';
  String province = '';
  final formKey = GlobalKey<FormState>();



void disposeControllers(){
  title.dispose();
  price.dispose();
  phone.dispose();
  description.dispose();
}


List<City> getCities(String province_id){
  List<City> cities = [];
  iran.cities.forEach((element) { 
    if(element.province_id == province_id){
      cities.add(element);
    }
  });
  return cities;
}


} 