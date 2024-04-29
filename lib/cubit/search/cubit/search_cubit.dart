import 'package:bloc/bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());



  void searchOpen(){
    emit(SearchOpenState());
  }

  void searchClose(){
    emit(SearchCloseState());
  }
}
