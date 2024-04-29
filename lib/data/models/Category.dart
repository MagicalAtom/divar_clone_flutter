import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


part 'Category.g.dart';


@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String icon;

  Category(this.id,this.name, this.icon);

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(map['id'].toString(),map['name'], map['filename']);
  }
}
