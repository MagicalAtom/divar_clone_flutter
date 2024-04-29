import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanjagh/configs/ApiException.dart';
import 'package:sanjagh/data/models/Ad.dart';

abstract class AdsRepositoryInterFace {
Future<Either<ApiException,String>> createAd(category,String title,String price,String status,String description,String location,List<XFile> images,String phone,String city);
Future<List<Ad>> getAllAds(int page);
Future<Either<ApiException,List<Ad>>> getAdByCategoryId(int category_id);
Future<Either<ApiException,List<Ad>>> getMyAds();
Future<Either<ApiException,List<Ad>>> searchAd(String search_key_words);
Future<Either<ApiException,String>> deleteAd(String ad_id);
}