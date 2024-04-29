import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sanjagh/data/repositories/authentication/authentication_repository_interface.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

AuthenticationRepositoryInterface authenticationRepository;


  AuthenticationBloc(this.authenticationRepository) : super(AuthenticationInitial()) {
    on<RegisterEvent>((event, emit) async {
      try {
        emit(AuthenticationLoading());
        final register = await authenticationRepository.register(event.username, event.email, event.password);
        emit(AuthenticationSuccess());
      }catch(e){
      emit(AuthenticationFailed());
      }
    });

    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthenticationLoading());
        final login = await authenticationRepository.login(event.email, event.password);
        emit(AuthenticationSuccess());
      }catch(e){
        emit(AuthenticationFailed());
      }
    });

  }
}
