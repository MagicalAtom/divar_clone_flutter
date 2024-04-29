import 'package:sanjagh/data/models/User.dart';

abstract class AuthenticationDataSourceInterFace {
  Future<User> register(String username,String email,String password);
  Future<User> login(String email,String password);
  Future<bool> logout();
}