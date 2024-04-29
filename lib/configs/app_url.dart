class AppUrl {
  // get app url , api base url
  static const String get = "http://192.168.1.10:8000";
  // static const String get = "http://10.0.2.2:8000";

  static const String register = '/api/v1/user/register';
  static const String login = '/api/v1/user/login';
  static const String catogory = '/api/v1/category/index';
  static const String ad = '/api/v1/ad/create';
  static const String adIndex = '/api/v1/ad/index';
  static const String findAd = '/api/v1/ad/find';
  static const String getAds = '/api/v1/category/find/';
  static const String searchAds = '/api/v1/ad/search';
  static const String deleteAds = '/api/v1/ad/delete';

}

