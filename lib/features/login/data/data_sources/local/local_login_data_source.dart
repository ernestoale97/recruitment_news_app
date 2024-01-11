import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum StorageKey {accessToken, verifyOtpToken}

class LocalLoginDataSource {
  final FlutterSecureStorage secureStorage;
  LocalLoginDataSource(this.secureStorage);

  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: StorageKey.accessToken.name);
  }

  Future<void> saveAccessToken(String token) async {
    await secureStorage.write(key: StorageKey.accessToken.name, value: token);
  }

  Future<String?> getVerifyTotpToken() async {
    return await secureStorage.read(key: StorageKey.verifyOtpToken.name);
  }

  Future<void> saveVerifyTotpToken(String token) async {
    await secureStorage.write(key: StorageKey.verifyOtpToken.name, value: token);
  }

  Future<void> clearStorage() async {
    await secureStorage.deleteAll();
  }
}
