part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}



final class LocationRequest extends LocationEvent {
double lat;
double lng;
LocationRequest(this.lat,this.lng);
}