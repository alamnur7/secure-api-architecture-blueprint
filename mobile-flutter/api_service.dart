import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final String _baseUrl = 'https://api.yourdomain.com/v1';

  // Securely store JWT Access Token
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'jwt_token', value: token);
  }

  // Retrieve stored token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'jwt_token');
  }

  // Execute authenticated API Request with Bearer Token
  Future<http.Response> getProtectedData(String endpoint) async {
    final token = await getToken();

    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }
}
