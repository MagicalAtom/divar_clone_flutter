import 'package:dartz/dartz.dart';
import 'package:sanjagh/data/datasources/authentication/authentication_datasource_interface.dart';
import 'package:sanjagh/data/models/User.dart';
import 'package:sanjagh/data/repositories/authentication/authentication_repository_interface.dart';

class AuthenticationRepository implements AuthenticationRepositoryInterface {
  AuthenticationDataSourceInterFace authenticationDataSource;

  AuthenticationRepository(this.authenticationDataSource);

  @override
  Future<Either<String, User>> login(String email, String password) async {
    try {
      final login = await authenticationDataSource.login(email, password);
      return right(login);
    } catch (e) {
      return left('ورود انجام نشد');
    }
  }

  @override
  Future<Either<String, String>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<String, User>> register(
      String username, String email, String password) async {
    try {
      final register =
          await authenticationDataSource.register(username, email, password);
      return right(register);
    } catch (e) {
      return left('ثبت نام انجام نشد!');
    }
  }
}
