import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanjagh/configs/ApiException.dart';
import 'package:sanjagh/data/repositories/ads/ads_repository_interface.dart';
import 'package:sanjagh/data/models/Ad.dart';

part 'ad_event.dart';
part 'ad_state.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  AdsRepositoryInterFace adsRepository;



  AdBloc(this.adsRepository) : super(AdInitial()) {



    on<AdCreateEvent>((event, emit) async {
      try {
        emit(AdLoading());
        final ad = await adsRepository.createAd(event.category,event.title,event.price,event.status,event.description,event.location,event.images,event.phone,event.city);
        emit(AdCreateState(ad));
      }catch(e){
        emit(AdErrorState());
      }
    });

    on<getCategoriesAdsEvent>((event, emit) async {
      try {
        emit(AdLoading());
        final ads =  await adsRepository.getAdByCategoryId(event.category_id);
        emit(getCategoriesAds(ads));
      }catch(e){
        emit(AdErrorState());
      }
    },);


  on<getMyAds>((event, emit) async {
    try {
      emit(AdLoading());
      final ads = await adsRepository.getMyAds();
      emit(getMyAdsState(ads));
    }catch(e){
      emit(AdErrorState());
    }
  });


  on<SearchAdEvent>((event, emit) async {
    try {
      emit(AdLoading()); // این امکان وجود داره که در هنگام جستجو کردن و نوشتن کلمه کلیدی هم بیایم و جست و جو رو انجام بدیم . اما اینطوری فشار کمتری به سرور وارد خواهد شد
      print(event.search_key_words);
      final SearchResult = await adsRepository.searchAd(event.search_key_words);
      emit(SearchAdState(SearchResult));
    } catch (e) {
      emit(AdErrorState());
    }


  });


  on<deleteAdEvent>((event, emit) async {
    emit(AdLoading());
    try {
      final delete = await adsRepository.deleteAd(event.ad_id);
      emit(DeleteAdState());
    }catch(e){
      emit(AdErrorState());
    }
  },);

  }
}
