import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


class CityCubit extends Cubit<int> {
CityCubit() : super(1);

changeCity(cityIndex){
emit(cityIndex);
}


}
