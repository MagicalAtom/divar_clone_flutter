import 'package:bloc/bloc.dart';


class ProvinceCubit extends Cubit<int> {
  ProvinceCubit() : super(1);

  changeProvince(Provinceindex){
    emit(Provinceindex);
  }
}
