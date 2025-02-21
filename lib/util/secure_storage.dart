import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final androidOptions = const AndroidOptions(encryptedSharedPreferences: true);
  final secureStorage = const FlutterSecureStorage();

  Future writeSecureData({required String key, required String value}) async {
    try {
      await secureStorage.write(
        key: key,
        value: value,
        aOptions: androidOptions,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String?> readSecureData({required String key}) async {
    try {
      return await secureStorage.read(key: key, aOptions: androidOptions);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteSecureData({required String key}) async {
    try {
      await secureStorage.delete(key: key, aOptions: androidOptions);
    } catch (e) {
      throw Exception(e);
    }
  }
}
