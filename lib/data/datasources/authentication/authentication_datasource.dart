
import 'package:dio/dio.dart';
import 'package:sanjagh/configs/app_url.dart';
import 'package:sanjagh/controllers/AuthController.dart';
import 'package:sanjagh/data/datasources/authentication/authentication_datasource_interface.dart';
import 'package:sanjagh/data/models/User.dart';
import 'package:sanjagh/libs/DioRequestLog.dart';

class AuthenticationDataSource implements AuthenticationDataSourceInterFace {
  Dio request;
  AuthController authController;

  AuthenticationDataSource(this.request, this.authController);

  @override
  Future<User> login(String email, String password) async {
    try {
      FormData _loginFormData = FormData.fromMap(
          {
            'email': email,
            'password': password,
          }
      );
      Response response = await request.post(
          AppUrl.login, data: _loginFormData);
      User user = User(
          response.data['data']['username'], response.data['data']['email'],
          response.data['token']);
      await authController.saveLogin(user);
      return user;
    } on DioException catch (e) {
      displayError(e);
      throw e;
    }

}

@override
Future<bool> logout() {
  // TODO: implement logout
  throw UnimplementedError();
}

@override
Future<User> register(String username, String email, String password) async {
  try {
    FormData _registerFormData = FormData.fromMap({
      "name": username,
      "email": email,
      "password": password
    });
    Response response = await request.post(
        AppUrl.register, data: _registerFormData);
    User user = User(
        response.data['data']['username'], response.data['data']['email'],
        response.data['token']);
    await authController.saveLogin(user);
    return user;
  } on DioException catch (e) {
    displayError(e);
    throw e;
  }
}}
