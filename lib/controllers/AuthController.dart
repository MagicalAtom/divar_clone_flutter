import 'package:sanjagh/data/models/User.dart';
import 'package:sanjagh/libs/AuthManager.dart';

class AuthController {
AuthManager authManager;
AuthController(this.authManager);


 saveLogin(User user) async {
  await authManager.saveToken(user.token);
  await authManager.saveEmail(user.email);
  await authManager.saveUsername(user.username);
}


  getUserData() async {
    String username = await authManager.getUsername();
    String email = await authManager.getEmail();
  }

}