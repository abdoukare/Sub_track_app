import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task5/core/routes/app_routes.dart';

class AuthController extends GetxController {
  var isLoggedin = false.obs;
  var error = ''.obs;
  var isLoading = false.obs;

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      error.value = "Email and Password cannot be empty";
      return;
    }
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoggedin.value = true;
    Get.offAllNamed(AppRoutes.home);
  }

  void logout() {
    isLoggedin.value = false;
    Get.offAllNamed(AppRoutes.signOut);
  }
}
