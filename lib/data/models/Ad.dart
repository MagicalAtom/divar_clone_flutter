
import 'package:sanjagh/data/models/Gallery.dart';

class Ad {
  String id;
  String name;
  String status;
  String price;
  String description;
  String map;
  String city;
  String phone;
  String category;
  String category_list_id;
  String created_at;
  List<Gallery> gallery;
  Ad(this.id,this.city,this.phone,this.name, this.category,this.category_list_id,this.description, this.gallery, this.map,
      this.price, this.status,this.created_at);
  factory Ad.fromJson(Map<String,dynamic> data) {
    return Ad(
      data['id'].toString(),
      data['city'].toString(),
      data['phone'].toString(),
      data['title'],
      data['category']['name'],
      data['category']['id'].toString(),
      data['description'],
      (data['upload_storages'] as List).map<Gallery>((element) => Gallery.from(element['path'])).toList(),
      data['map'],
      data['price'],
      data['status'],
      data['created_at']
      );
  }

}
