import 'package:sanjagh/configs/app_key.dart';
import 'package:sanjagh/libs/localStorage.dart';

class AuthManager {
 static Future<bool> isLogin() async {
    String token = await storage.read(key: AppKey.token) ?? '';
    if (token.isNotEmpty && token != '') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> saveToken(token) async {
    await storage.write(key: AppKey.token, value: token);
    return true;
  }

   Future<String> getToken() async {
    String token = await storage.read(key: AppKey.token) ?? '';
    if (token.isNotEmpty || token != '') {
      return token;
    } else {
      return '';
    }
  }


  static Future logout() async {
    storage.delete(key: AppKey.token);
  }

  Future<bool> saveEmail(String email) async {
    await storage.write(key: AppKey.userEmail, value: email);
    return true;
  }

  Future<String> getEmail() async {
    String email = await storage.read(key: AppKey.userEmail) ?? '';
    if (email.isNotEmpty || email != '') {
      return email;
    } else {
      return '';
    }
  }

  Future<bool> saveUsername(String username) async {
    await storage.write(key: AppKey.userName, value: username);
    return true;
  }

  Future<String> getUsername() async {
    String username = await storage.read(key: AppKey.userName) ?? '';
    if (username.isNotEmpty || username != '') {
      return username;
    } else {
      return '';
    }
  }



}
