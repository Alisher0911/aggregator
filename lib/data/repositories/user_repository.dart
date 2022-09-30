import 'package:aggregator/consts/api_url.dart';
import 'package:aggregator/data/models/tokens/tokens_model.dart';
import 'package:aggregator/data/models/user/user_model.dart';
import 'package:aggregator/data/models/user_auth/user_auth_model.dart';
import 'package:aggregator/data/services/api_client.dart';
import 'package:aggregator/data/services/secure_storage_client.dart';
import 'package:dio/dio.dart';

class UserRepository {

  final _apiClient = ApiClient();
  final _storage = SecureStorageClient.getInstance;

  Future<bool> hasToken() async {
    var value = await _storage.read(key: "accessToken");
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(Tokens tokens) async {
    await _storage.write(key: 'accessToken', value: tokens.accessToken);
    await _storage.write(key: 'refreshToken', value: tokens.refreshToken);
  }

  Future<void> deleteToken() async {
    _storage.delete(key: 'accessToken');
    _storage.delete(key: 'refreshToken');
    _storage.deleteAll();
  }

  Future<UserAuth> login(String email, String password) async {
    Response response = await _apiClient.api.post("/auth/login", data: {
      "email": email,
      "password": password,
    });
    return UserAuth.fromJson(response.data);
  }

  Future<UserAuth> register(String email, String nickname, String phone, String password) async {
    Response response = await _apiClient.api.post("/auth/registration/customer/new", data: {
      "email": email,
      "nickname": nickname,
      "phone": phone,
      "password": password
    });
    return UserAuth.fromJson(response.data);
  }

  Future<User> getUserProfile() async {
    final response = await _apiClient.api.get("/auth/login/profile");
    if (response.statusCode == 200) {
      print(response.data);
      return User.fromJson(response.data);
    } else {
      throw Exception("Failed to load user");
    }
  }
}