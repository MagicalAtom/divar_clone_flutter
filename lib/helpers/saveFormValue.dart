import 'package:shared_preferences/shared_preferences.dart';

class SaveFormValue {
  SharedPreferences localStorage;

  SaveFormValue(this.localStorage);

  Future saveFormValue(String name, String value) async {
    await localStorage.setString(name, value);
  }

  String getFormValue(String name) {
    String value = localStorage.getString(name) ?? '';
    return value;
  }
}
