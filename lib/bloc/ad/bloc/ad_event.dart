part of 'ad_bloc.dart';

sealed class AdEvent extends Equatable {
  const AdEvent();

  @override
  List<Object> get props => [];
}

final class AdCreateEvent extends AdEvent {
  final category;
  String title;
  String price;
  String status;
  String description;
  String location;
  List<XFile> images;
  String phone;
  String city;

  AdCreateEvent(this.title, this.status, this.price, this.location,
      this.category, this.description, this.images, this.phone, this.city);
}

final class getMyAds extends AdEvent {}

final class SearchAdEvent extends AdEvent {
  String search_key_words;
  SearchAdEvent(this.search_key_words);
}

final class getCategoriesAdsEvent extends AdEvent {
  final int category_id;
  getCategoriesAdsEvent(this.category_id);
}

final class deleteAdEvent extends AdEvent {
  final String ad_id;
  deleteAdEvent(this.ad_id);
}

