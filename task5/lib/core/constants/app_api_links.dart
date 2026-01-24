import 'package:flutter/services.dart';

class AppLinkApi {
  //static const String server = "http://localhost:5500";
  static const String server = "http://10.0.2.2:5500";
  // authentication endpoints 
  static const String signUp = "$server/api/v1/auth/sign-up";
  static const String logIn = "$server/api/v1/auth/sign-in";
  static const String signOut = "$server/api/v1/auth/sign-out";
}
