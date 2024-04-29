import 'package:sanjagh/configs/app_url.dart';

String changeStatusNumber(number){
  switch(number){
    case 1:
    return 'نو';
    case 2:
    return 'در حد نو';
    case 3:
    return 'نیاز به تعمیر';
    default:
    return '';
  }
}



String addQueryParam(String url,Map<String,dynamic> params){
String finalUrl = '$url?';
params.forEach((key,value){
  finalUrl += "$key=$value&";
});
  return finalUrl;
}


String getFullImagePath(String path){
  return '${AppUrl.get}/$path';
}
