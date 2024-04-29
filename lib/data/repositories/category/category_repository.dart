import 'package:dartz/dartz.dart';
import 'package:sanjagh/configs/ApiException.dart';
import 'package:sanjagh/data/datasources/category/category_datasource.dart';
import 'package:sanjagh/data/datasources/category/category_local_datasource.dart';
import 'package:sanjagh/data/models/Category.dart';
import 'package:sanjagh/data/repositories/category/category_repository_interface.dart';

class CategoryRepository implements CategoryRepositoryInterFace {
  CategoryDataSource categoryDataSource;
  CategoryLocalDataSource categoryLocalDataSource;

  CategoryRepository(this.categoryDataSource, this.categoryLocalDataSource);

  @override
  Future<Either<ApiException, List<Category>>> getCategories() async {
    try {
      final categories = await categoryDataSource.getCategories();
      return right(categories);
    } catch (e) {
      return left(ApiException('دریافت دسته بندی ها با خطا مواجه شد',
          'categories', 'get categories'));
    }
  }

  @override
  addLastCategories(Category category) =>
      categoryLocalDataSource.addLastCategories(category);

  @override
  getLastCategoriesView() {
    final categories = categoryLocalDataSource.getCategories();
    return categories;
  }
}
