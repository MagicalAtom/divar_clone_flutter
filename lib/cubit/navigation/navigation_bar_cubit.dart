import 'package:bloc/bloc.dart';


class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(0);



  void changeIndex(index){
    emit(index);
  }
}
