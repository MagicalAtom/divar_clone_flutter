import 'package:hive/hive.dart';
import 'package:sanjagh/data/datasources/category/category_datasource_interface.dart';
import 'package:sanjagh/data/models/Category.dart';

class CategoryLocalDataSource implements CategoryDataSourceInterFace {
  Box box;


  CategoryLocalDataSource(this.box);


  addLastCategories(Category category) async {
  var existingKey = box.keys.firstWhere(
    (k) => box.get(k).id == category.id,
    orElse: () => null,
  );

  if (existingKey != null) {
    await box.delete(existingKey);
  }

  await box.add(category);
}
  
  @override
  getCategories() {
    return box.values.toList();
  }



}