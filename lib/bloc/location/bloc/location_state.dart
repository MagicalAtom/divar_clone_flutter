part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();
  
  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}


final class LocationLoading extends LocationState {}

final class LocationRequestState extends LocationState {
  UserLocation userLocation;
  LocationRequestState(this.userLocation);
}