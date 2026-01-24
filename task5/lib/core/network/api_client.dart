import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:task5/core/constants/app_api_links.dart';
import 'package:task5/core/services/storage_service.dart';

class ApiClient {
  final StorageService _storage = Get.find<StorageService>();

  Map<String, String> _getHeader({bool requiresAuth = false}) {
    final headers = {'Content-Type': 'application/json'};
    if (requiresAuth) {
      final token = _storage.getToken(); // gettoken wil be created in servicecs 
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  // Authentication endpoint controller

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(AppLinkApi.signUp),
      headers: _getHeader(),
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );
    return _handleResponse(response); // handleResponse will be created in services 
  }

}
