import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  var _box;
  static const String _tokenKey = 'auth_token';

  Future<StorageService> init() async {
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
}
