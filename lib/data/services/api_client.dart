import 'package:aggregator/consts/api_url.dart';
import 'package:aggregator/data/models/tokens/tokens_model.dart';
import 'package:aggregator/data/services/secure_storage_client.dart';
import 'package:dio/dio.dart';

class ApiClient {
  Dio api = Dio();
  String? accessToken;
  final _storage = SecureStorageClient.getInstance;

  ApiClient() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
          if (!options.path.contains('http')) {
            options.path = baseUrl + options.path;
          }
          if (options.path != "$baseUrl/auth/login" || !options.path.contains("registration")){
            print("Path - ${options.path}");
            final token = await _storage.read(key: "accessToken");
            print("Access token - $token");
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        }, onError: (e, handler) async {
          if (e.response?.statusCode != 200 && e.response?.data['message'] == 'Invalid token!') {
            if (await _storage.containsKey(key: "refreshToken")) {
              await refreshToken();
              return handler.resolve(await _retry(e.requestOptions));
            }
          }
          return handler.next(e);
        },));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers
    );
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options
    );
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    print("Refresh token - $refreshToken");
    final response = await api.post("/auth/login/refresh", data: { 'refreshToken' : refreshToken });
    if (response.statusCode == 200) {
      final newAccessToken = Tokens.fromJson(response.data["tokens"]).accessToken;
      final newRefreshToken = Tokens.fromJson(response.data["tokens"]).refreshToken;
      print("New access token - $newAccessToken");
      print("New refresh token - $newRefreshToken");
      await _storage.write(key: "accessToken", value: newAccessToken);
      await _storage.write(key: "refreshToken", value: newRefreshToken);
    } else {
      accessToken = null;
      _storage.deleteAll();
    }
  }
}