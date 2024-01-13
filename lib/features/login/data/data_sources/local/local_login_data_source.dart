import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

enum StorageKey {accessToken, verifyOtpToken, userEmail}

abstract class LocalLoginDataSource {
  Future<String?> getUserEmail();
  Future<void> saveUserEmail(String email);
  Future<String?> getAccessToken();
  Future<void> saveAccessToken(String token);
  Future<String?> getVerifyTotpToken();
  Future<void> saveVerifyTotpToken(String token);
  Future<void> clearStorage();
}

class LocalLoginDataSourceImpl extends LocalLoginDataSource {
  final FlutterSecureStorage secureStorage;
  final http.Client client;
  LocalLoginDataSourceImpl(this.secureStorage, this.client);

  @override
  Future<String?> getUserEmail() async {
    return await secureStorage.read(key: StorageKey.userEmail.name);
  }

  @override
  Future<void> saveUserEmail(String email) async {
    await secureStorage.write(key: StorageKey.userEmail.name, value: email);
  }

  @override
  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: StorageKey.accessToken.name);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await secureStorage.write(key: StorageKey.accessToken.name, value: token);
  }

  @override
  Future<String?> getVerifyTotpToken() async {
    return await secureStorage.read(key: StorageKey.verifyOtpToken.name);
  }

  @override
  Future<void> saveVerifyTotpToken(String token) async {
    await secureStorage.write(key: StorageKey.verifyOtpToken.name, value: token);
  }

  @override
  Future<void> clearStorage() async {
    await secureStorage.deleteAll();
  }
}
