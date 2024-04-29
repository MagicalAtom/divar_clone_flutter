import 'package:dio/dio.dart';
import 'package:sanjagh/configs/app_url.dart';
import 'package:sanjagh/data/datasources/category/category_datasource_interface.dart';
import 'package:sanjagh/data/models/Category.dart';
import 'package:sanjagh/libs/DioRequestLog.dart';

class CategoryDataSource implements CategoryDataSourceInterFace<Future<List<Category>>> {
  Dio request;

  CategoryDataSource(this.request);

  @override
    getCategories() async {
    try {
      Response response = await request.get(AppUrl.catogory);
      List<Category> category = [];
      if (response.statusCode == 200) {
        for (var element in (response.data['data'] as List)) {
          category.add(Category.fromMap(
              element)); // convert  map object return from dio (api) to Category class Instance for easy work this
        }
      }
      return category;
    } on DioException catch (e) {
      displayError(e);
      throw e;
    }
  }

}
