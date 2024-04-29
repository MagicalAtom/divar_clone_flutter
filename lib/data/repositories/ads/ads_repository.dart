import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanjagh/configs/ApiException.dart';
import 'package:sanjagh/data/datasources/ads/ads_datasource_interface.dart';
import 'package:sanjagh/data/models/Ad.dart';
import 'package:sanjagh/data/repositories/ads/ads_repository_interface.dart';

class AdsRepository implements AdsRepositoryInterFace {

  AdsDataSourceInterface adsDataSource;

  AdsRepository(this.adsDataSource);


  @override
  Future<Either<ApiException, String>> createAd(category, String title, String price, String status, String description, String location, List<XFile> images,String phone,String city) async {
    try {
      final adCreate = await adsDataSource.createAd(category, title, price,status, description, location, images,phone,city);
      return right(adCreate);
    }catch(e){
    return left(ApiException('ثبت آگهی با خطا رو به رو شد',title, 'AdCreate'));
    }

  }

  @override
  Future<List<Ad>> getAllAds(int page) async {
    try {
      final ads = await adsDataSource.getAllAds(page);
      return ads;
    }catch(e){
      throw e;
    }
  }
  
  @override
  Future<Either<ApiException, List<Ad>>> getAdByCategoryId(int category_id) async {
   try {
    final req = await adsDataSource.getAdByCategoryId(category_id);
    return right(req);
   }catch(e) {
    return left(ApiException('دریافت آگهی های این دسته بندی با خطا رو به رو شد',category_id.toString(),'getAds'));
   }
  }
  
  @override
  Future<Either<ApiException, List<Ad>>> getMyAds() async {
    try {
      final get = await adsDataSource.getMyAds();
      return right(get);
    }catch(e){
      return left(ApiException('هیچ آگهی وجود ندارد یا دریافت آگهی های شما به خطا رو به رو شده است', 'null', 'get My ads'));
    }
  }
  
  @override
  Future<Either<ApiException, List<Ad>>> searchAd(String search_key_words) async {
    try {
      final search = await adsDataSource.searchAd(search_key_words);
      return right(search);
    }catch(e){
    return left(ApiException('جستجو آگهی با خطا رو به رو شد',search_key_words,'search ads'));
    }
  }
  
  @override
  Future<Either<ApiException, String>> deleteAd(String ad_id) async {
    try {
      final delete = await adsDataSource.deleteAd(ad_id);
      return right('$ad_id');
    }catch(e){
      return left(ApiException('حذف آگهی با خطا رو به رو شد', ad_id, 'delete ad'));
    }
  }
  

}