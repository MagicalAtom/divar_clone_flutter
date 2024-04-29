import 'package:bloc/bloc.dart';


class StatusAdCubit extends Cubit<int> {
  StatusAdCubit() : super(1);

  void changeIndex(index){
    emit(index);
  }

}
