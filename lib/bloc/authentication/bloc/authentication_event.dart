part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class RegisterEvent extends AuthenticationEvent {
  String email;
  String username;
  String password;
  RegisterEvent(this.username,this.email,this.password);
}
final class LoginEvent extends AuthenticationEvent {
  String email;
  String password;
  LoginEvent(this.email,this.password);
}