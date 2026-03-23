import 'dart:async';
import 'package:task5/core/services/storage_service.dart';
import '../../core/network/api_client.dart';
/*
  THIS FILE IS FULL OF ERRORS . 
  BUG 1 => Unusual Response Format (Data as Array)
    f  backend returns { data: { user: {...}, token: "..." } } instead of array, the app crashes.
  Missing Token Extraction Logic => the ser info is not stored is lost 
*/

class AuthRepo {
  final ApiClient apiClient;
  final StorageService storageService;
  AuthRepo({required this.apiClient, required this.storageService});

  // login
  Future<Map<String, dynamic>> Login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.login(email: email, password: password);

    // backend reponse is {successs, msg, data:[user, token]}
    final data = response['data'];
    if (data is List && data.length >= 2) {
      final user = data[0] as String;
      final token = data[1] as String;

      await storageService.saveToken(token);
      await storageService.saveUser(user as Map<String, dynamic>);

      return {'user': user, 'token': token};
    }
    throw Exception('Invalid response format');
  }

  // Register Sign-up (returns object)
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await apiClient.register(
      name: name,
      email: email,
      password: password,
    );
    final data = response['data'];
    if (data is Map<String, dynamic>) {
      final user = data['user'] as String;
      final token = data['token'] as String;

      await storageService.saveToken(token);
      await storageService.saveUser(user as Map<String, dynamic>);
      return {'user': user, 'token': token};
    }
    throw Exception('Invalid response format');
  }
}
