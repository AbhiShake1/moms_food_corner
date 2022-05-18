import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart' hide MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://momsfoodcorner.up.railway.app';
  }

  Future<User> signUp({
    required String username,
    required String password,
  }) async {
    final response = await _sendPostRequest(
      'api=auth/signup/',
      fields: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode < 400) {
      final user =
          User.fromJson(jsonDecode(await response.stream.bytesToString()));
      _saveUser(user);
      return user;
    }
    return await Future.error('Invalid Credentials');
  }

  Future<User> login({
    required String username,
    required String password,
  }) async {
    final response = await _sendPostRequest(
      'api=auth/login/',
      fields: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode < 400) {
      final user =
          User.fromJson(jsonDecode(await response.stream.bytesToString()));
      _saveUser(user);
      return user;
    }
    return await Future.error('Invalid Credentials');
  }

  Future<User> getUser({required String username}) async {
    final response = await get(
      Uri.parse(
          'https://momsfoodcorner.up.railway.app/api=auth/get_user/username=$username'),
    );
    return response.statusCode < 400
        ? User.fromJson(jsonDecode(response.body))
        : await Future.error('No such user');
  }

  Future<StreamedResponse> _sendPostRequest(
    String url, {
    required Map<String, String> fields,
    Map<String, String>? files,
    Map<String, String>? headers,
  }) async {
    final request = MultipartRequest(
        'POST', Uri.parse('https://momsfoodcorner.up.railway.app/$url'));
    fields.forEach((key, value) => request.fields[key] = value);
    files?.forEach((key, filePath) async =>
        request.files.add(await MultipartFile.fromPath(key, filePath)));
    headers?.forEach((key, value) => request.headers[key] = value);
    return await request.send();
  }

  static final _box = GetStorage('Auth');

  static void _saveUser(User user) => _box.write('user_key', user);

  void logout() => _box.erase();
  User? get currentUser {
    final user = _box.read('user_key');
    return user == null ? null : User.fromJson(user);
  }
}
