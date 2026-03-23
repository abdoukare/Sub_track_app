//import 'package:flutter/services.dart';
import 'package:task5/core/services/storage_service.dart';

class AppLinkApi {
  //static const String server = "http://localhost:5500";
  //static const String server = "http://192.168.1.35:5500"; hada ta3 mobile
  static const String server = "http//10.0.2.2:5500"; // hada ta3 emulator
  // the IP of pc will work on physical android phone not emulators
  // the emulator
  // authentication endpoints
  static const String signUp = "$server/api/v1/auth/sign-up";
  static const String logIn = "$server/api/v1/auth/sign-in";
  static const String signOut = "$server/api/v1/auth/sign-out";
  static const String getSubscriptions = "$server/api/v1/subscription";
}

// Initialize AND call init() asynchronously
final storageService = StorageService();
void initializeAppLinks() async {
  await storageService.init();
}
