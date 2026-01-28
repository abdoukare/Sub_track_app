import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task5/core/network/api_client.dart';
import 'package:task5/core/services/storage_service.dart';
import 'package:task5/data/repositories/auth_repo.dart';
import 'features/auth/views/OnboardingScreen.dart';

void main() {
  // Register services with GetX BEFORE running the app
  _setupServices();
  runApp(const MyApp());
}

void _setupServices() {
  // 1. Register StorageService (singleton)
  Get.put<StorageService>(StorageService());

  // 2. Register ApiClient (depends on StorageService)
  Get.put<ApiClient>(ApiClient());

  // 3. Register AuthRepo (depends on ApiClient and StorageService)
  Get.put<AuthRepo>(
    AuthRepo(
      apiClient: Get.find<ApiClient>(),
      storageService: Get.find<StorageService>(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subscription Tracker',
      home: const Onboardingscreen(),
    );
  }
}
