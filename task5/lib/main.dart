import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task5/core/network/api_client.dart';
import 'package:task5/core/routes/app_pages.dart';
import 'package:task5/core/routes/app_routes.dart';
import 'package:task5/core/services/storage_service.dart';
import 'package:task5/data/repositories/auth_repo.dart';
import 'features/auth/views/OnboardingScreen.dart';

void main() async {
  // Initialize Hive and setup services BEFORE running the app
  await _setupServices();
  runApp(const MyApp());
}

Future<void> _setupServices() async {
  // 1. Initialize and Register StorageService (singleton)
  final storageService = StorageService();
  await storageService.init();
  Get.put<StorageService>(storageService);

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subscription Tracker',
      home: const Onboardingscreen(),
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.routes,
    );
  }
}
