import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<Map<String, dynamic>> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://127.0.0.1:8000/auth/signup',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password,
          },
        ),
      );
      if (response.statusCode != 201) {
        // handle error
        return {'error': 'Failed to signup', 'statusCode': response.statusCode};
      } else {
        final user = jsonDecode(response.body) as Map<String, dynamic>;
        return user;
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://127.0.0.1:8000/auth/signup',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
    } catch (e) {
      print('Signin error: $e');
      // Handle the error as needed
    }
  }
}
