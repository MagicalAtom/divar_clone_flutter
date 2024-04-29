import 'package:bloc/bloc.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());


  void chnageTheme(){
    emit(state is ChangeThemeLight ? ChangeThemeDark() : ChangeThemeLight());
  }


}
