import 'dart:convert';
import 'package:flutter/widgets.dart';
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
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse(AppLinkApi.logIn);

    debugPrint('Requeste');
    debugPrint('URI: $uri');
    debugPrint('Headers: ${_getHeader()}');
    debugPrint('Body: ${jsonEncode({'email': email, 'password': password})}');
    try {
      final response = await http.post(
        uri,
        headers: _getHeader(),
        body: jsonEncode({'email': email, 'password': password}),
      );

      debugPrint('RESPONSE');
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('RAW BODY: ${response.body}');
      debugPrint('HEADERS: ${response.headers}');

      return _handleResponse(response);
    } catch (e) {
      debugPrint(' HTTP ERROR');
      debugPrint(e.toString());
      rethrow;
    }
  }

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
    return _handleResponse(
      response,
    ); // handleResponse will be created in services
  }

  // handling status code
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      final error = jsonDecode(response.body);
      throw ApiException(
        message: error['message'] ?? 'An error occured!',
        statusCode: response.statusCode,
      );
    }
  }

  Future<List<dynamic>> getSubscriptions(String userId) async {
    final uri = Uri.parse('${AppLinkApi.getSubscriptions}/$userId');

    try {
      final response = await http.get(
        uri,
        headers: _getHeader(requiresAuth: true), // ✅ Need auth token
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        return data['data'] as List;
      } else {
        throw ApiException(
          message: jsonDecode(response.body)['error'] ?? 'Failed to fetch',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      debugPrint('Error :  $e');
      rethrow;
    }
  }
}

class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException({required this.message, required this.statusCode});

  @override
  String toString() => message;
}
