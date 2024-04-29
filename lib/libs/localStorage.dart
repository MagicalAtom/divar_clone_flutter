import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  createStorage() {
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    return storage;
  }

}

LocalStorage localStorage = LocalStorage();
FlutterSecureStorage storage = localStorage.createStorage();