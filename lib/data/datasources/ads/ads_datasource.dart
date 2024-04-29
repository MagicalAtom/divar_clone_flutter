import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanjagh/configs/app_url.dart';
import 'package:sanjagh/controllers/CityController.dart';
import 'package:sanjagh/data/datasources/ads/ads_datasource_interface.dart';
import 'package:sanjagh/data/models/Ad.dart';
import 'package:sanjagh/helpers/helpers.dart';
import 'package:sanjagh/libs/DioRequestLog.dart';

class AdsDataSource implements AdsDataSourceInterface {
  Dio request;
  AdsDataSource(this.request);

  @override
  Future createAd(category, String title, String price, String status,
      String description, String location, List<XFile> images,String phone,String city) async {
    try {
      FormData formData = FormData.fromMap({
        'title': title.toString(),
        'price': price.toString(),
        'status': status.toString(),
        'description': description.toString(),
        'map': location.toString(),
        'city': city.toString(),
        'phone': phone.toString(),
        'category_id': category,
      });
      for (int i = 0; i < images.length; i++) {
        formData.files.add(
            MapEntry('images[]', await MultipartFile.fromFile(images[i].path)));
      }
      Response response = await request.post(AppUrl.ad, data: formData);
      if (response.statusCode == 200) {
        return 'ad created';
      }
    } on DioException catch (e) {
      displayError(e);
      throw e;
    }
  }

  @override
  Future<List<Ad>> getAllAds(int page) async {
    try {
      String? userCity = await CityController().getUserCity();
      int lastpage = 1;
      List<Ad> ads = [];
      Response response =
          await request.get(addQueryParam(AppUrl.adIndex,{"page":page,"city":userCity.toString()}));
       
      if (response.statusCode == 200) {
        for (var element in response.data['ads']['data']) {
          ads.add(Ad.fromJson(element));
        }
      }
      return ads;
    } on DioException catch (e) {
      displayError(e);
      throw e;
    }
  }
  
  @override
  Future<List<Ad>> getAdByCategoryId(int category_id) async {
    try {
      List<Ad> adss = [];
      Response response = await request.get(AppUrl.getAds + category_id.toString());
      log('before');
      if(response.statusCode == 200){
        for (var element in response.data['data']) {
          adss.add(Ad.fromJson(element));
        }
      }
      return adss;
    }on DioException catch(e){
      displayError(e);
      throw e;
    }


  }
  
  @override
  Future<List<Ad>> getMyAds() async {
    try {
    List<Ad> ads = [];
    Response response = await request.get(AppUrl.findAd);
    if(response.statusCode == 200){
      for (var ad in response.data['ads']) {
        ads.add(Ad.fromJson(ad));
      }
    }
  return ads;
    }on DioException catch(e){
      displayError(e);
      throw e;
    }
  }
  
  @override
  Future<List<Ad>> searchAd(String search_key_words) async {
    try {
      List<Ad> ads = [];
      Response response = await request.get(AppUrl.searchAds,queryParameters:{
        'keyword':search_key_words,
      });
    if(response.statusCode == 200){
      for (var ad in response.data['data']) {
        ads.add(Ad.fromJson(ad));
      }
    }
    return ads;
    }on DioException catch(e){
      displayError(e);
      throw e;
    }
  }
  
  @override
  Future deleteAd(String ad_id) async {
   try {
    Response response  = await request.delete('${AppUrl.deleteAds}/$ad_id');
   }on DioException catch(e){
    displayError(e);
   }
  }





}
