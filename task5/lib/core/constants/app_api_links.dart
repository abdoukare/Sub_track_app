import 'package:flutter/services.dart';
import 'package:task5/core/services/storage_service.dart';

class AppLinkApi {
  //static const String server = "http://localhost:5500";
  static const String server = "http://192.168.1.35:5500";
  // authentication endpoints
  static const String signUp = "$server/api/v1/auth/sign-up";
  static const String logIn = "$server/api/v1/auth/sign-in";
  static const String signOut = "$server/api/v1/auth/sign-out";
}

// Initialize AND call init() asynchronously
final storageService = StorageService();
void initializeAppLinks() async {
  await storageService.init();
}
