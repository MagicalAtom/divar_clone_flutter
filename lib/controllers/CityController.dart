import 'package:sanjagh/configs/app_data.dart';
import 'package:sanjagh/configs/app_key.dart';
import 'package:sanjagh/data/models/City.dart';
import 'package:sanjagh/data/models/Province.dart';
import 'package:sanjagh/libs/localStorage.dart';

class CityController {


  List<City> getCities(){
    return iran.cities;
  }

  List<Province> getProvince(){
    return iran.Provinces;
  }
  
  saveUserCity({required String city}) async {
    await storage.write(key: AppKey.user_city_key, value: city.toString());
  }
  
  Future<String?> getUserCity() async {
    return await storage.read(key: AppKey.user_city_key) ?? 'تهران';
  }

  
}