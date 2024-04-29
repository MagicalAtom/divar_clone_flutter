import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sanjagh/data/datasources/location/neshan_datasource.dart';
import 'package:sanjagh/data/models/Location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  Neshan neshan;
  LocationBloc(this.neshan) : super(LocationInitial()) {
    on<LocationRequest>((event, emit) async {
      emit(LocationLoading());
      final location = await neshan.getLocation(event.lat,event.lng);
      emit(LocationRequestState(location));
    });
  }
}
