import 'package:dartz/dartz.dart';
import 'package:sanjagh/configs/ApiException.dart';
import 'package:sanjagh/data/models/Category.dart';
abstract class CategoryRepositoryInterFace {
Future<Either<ApiException,List<Category>>> getCategories();
   getLastCategoriesView();
   addLastCategories(Category category);
}