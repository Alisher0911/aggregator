import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageClient {

  static final SecureStorageClient _instance = SecureStorageClient._internal();
  late FlutterSecureStorage flutterSecureStorage;

  SecureStorageClient._internal() {
    flutterSecureStorage = const FlutterSecureStorage();
  }

  static SecureStorageClient get getInstance => _instance;

  Future<void> write({required String key, value}) async {
    await flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await flutterSecureStorage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await flutterSecureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await flutterSecureStorage.deleteAll();
  }

  Future<bool> containsKey({required String key}) async {
    var containsKey = await flutterSecureStorage.containsKey(key: key);
    return containsKey;
  }
}
