part of 'ads_cubit.dart';

sealed class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object> get props => [];
}

final class AdsInitial extends AdsState {}


final class AdsLoaded extends AdsState {
  final List<Ad> ads;
  AdsLoaded(this.ads);
}

class AdsLoading extends AdsState {
  final List<Ad> oldAds;
  final bool isFirstPage;

  AdsLoading({required this.oldAds,this.isFirstPage = false});
}