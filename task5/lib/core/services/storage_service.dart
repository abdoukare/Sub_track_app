import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';

class StorageService extends GetxService {
  late Box _box;
  final String _tokenKey = 'auth_token';
  final String _userkey = 'current_user';
  Future<StorageService> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('app_storage');
    return this;
  }

  // Token management
  String? getToken() {
    return _box.get(_tokenKey);
  }

  Future<void> saveToken(String token) async {
    await _box.put(_tokenKey, token);
  }

  Future<void> removeToken(String token) async {
    await _box.delete(_tokenKey);
  }

  Map<String, dynamic>? getUser() {
    final userJson = _box.get(_userkey);
    if (userJson == null) return null;
    return jsonDecode(userJson) as Map<String, dynamic>;
  }

  String? getUserId() {
    final user = getUser();
    return user?['_id'] as String?; // MongoDB uses _id
  }

  // Save user as JSON string
  Future<void> saveUser(Map<String, dynamic> user) async {
    final userJson = jsonEncode(user); // Convert Map → JSON string
    await _box.put(_userkey, userJson);
  }

  Future<void> clearUser() async {
    await _box.delete(_userkey);
  }
}
