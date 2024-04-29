import 'package:image_picker/image_picker.dart';
import 'package:sanjagh/data/models/Ad.dart';
abstract class AdsDataSourceInterface {
Future createAd(category,String title,String price,String status,String description,String location,List<XFile> images,String phone,String city);
Future<List<Ad>> getAllAds(int page);
Future<List<Ad>> getAdByCategoryId(int category_id);
Future<List<Ad>> getMyAds();
Future<List<Ad>> searchAd(String search_key_words);
Future deleteAd(String ad_id);
}