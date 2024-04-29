import 'package:dartz/dartz.dart';
import 'package:sanjagh/data/models/User.dart';
abstract class AuthenticationRepositoryInterface {
  Future<Either<String,User>> register(String username,String email,String password);
  Future<Either<String,User>> login(String email,String password);
  Future<Either<String,String>> logout();
}