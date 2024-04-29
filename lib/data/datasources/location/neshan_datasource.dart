import 'package:dio/dio.dart';
import 'package:sanjagh/configs/app_key.dart';
import 'package:sanjagh/data/models/Location.dart';
import 'package:sanjagh/libs/DioRequestLog.dart';
class Neshan {

  Future<UserLocation> getLocation(double lat,double lng) async {
    try {
      Dio _dio = Dio();
      _dio.options.headers['Api-Key'] = '${AppKey.neshanKey}';
      Response response = await _dio.get('https://api.neshan.org/v5/reverse?lat=$lat&lng=$lng');
      if(response.statusCode == 200){
        return UserLocation(response.data['formatted_address']);
      }else{
        return UserLocation('آدرس یابی با خطا مواجه شد . ');
      }
    }on DioException catch(e){
      displayError(e);
      throw e;
    }
  }
}