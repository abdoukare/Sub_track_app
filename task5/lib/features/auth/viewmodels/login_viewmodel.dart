import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task5/data/repositories/auth_repo.dart';

class LoginViewmodel extends GetxController {
  final AuthRepo authRepository;
  LoginViewmodel(this.authRepository);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMes;
  bool isSuccess = false;

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    print("login called");
    print("email: $email, password: $password");

    // 1. validate
    if (email.isEmpty || password.isEmpty) {
      errorMes = "Email and Password cannot be empty";
      update(); // Notify GetX to rebuild
      return;
    }
    // 2. set loading = true
    isLoading = true;
    update();

    // 3. call repository
    print("calling backend");
    try {
      await authRepository.Login(email: email, password: password);
      // 4. handle success
      errorMes = null; // Clear any previous errors
      isSuccess = true;
    } catch (e) {
      // 4. handle error
      errorMes = e.toString();
      isSuccess = false;
    }
    isLoading = false;
    update(); // Notify GetX to rebuild
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
