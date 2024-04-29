part of 'ad_bloc.dart';

sealed class AdState extends Equatable {
  AdState();
  List<Ad> adsListt = [];
  @override
  List<Object> get props => [];
}



final class AdInitial extends AdState {}





final class AdLoading extends AdState {}




final class AdCreateState extends AdState {
  Either<ApiException,String> adCreate;
  AdCreateState(this.adCreate);
}





final class getCategoriesAds extends AdState {
  Either<ApiException,List<Ad>> ads;
  getCategoriesAds(this.ads);
}


final class getMyAdsState extends AdState {
  Either<ApiException,List<Ad>> ads;
  getMyAdsState(this.ads);
}

final class SearchAdState extends AdState {
  Either<ApiException,List<Ad>> ads;
  SearchAdState(this.ads);
}


final class DeleteAdState extends AdState {}


final class AdErrorState extends AdState {}

