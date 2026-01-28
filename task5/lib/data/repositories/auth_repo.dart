import 'package:task5/core/services/storage_service.dart';
import '../../core/network/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final StorageService storageService;
  AuthRepo({required this.apiClient, required this.storageService});

  // login
  Future<void> Login({required String email, required String password}) async {
    final response = await apiClient.login(email: email, password: password);
    print("Response from backend: $response");

    // Backend returns: { success, message, data: [user, token] }
    final dataList = response['data'] as List;
    final token = dataList[1] as String;

    print("Token extracted: $token");
    await storageService.saveToken(token);
  }

  // Register

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await apiClient.register(
      name: name,
      email: email,
      password: password,
    );
    print("Response from backend: $response");

    // Backend returns: { success, message, data: [user, token] }
    final dataList = response['data'] as List;
    final token = dataList[1] as String;

    print("Token extracted: $token");
    await storageService.saveToken(token);
    return token.isNotEmpty;
  }
}
