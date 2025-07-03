import 'dart:convert';

import 'package:fpdart/fpdart.dart' show Either, Left, Right;
import 'package:http/http.dart' as http;
import 'package:sales_reps/core/failure/failure.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, Map<String, dynamic>>> signup({
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
        return Left(AppFailure.server(response.body));
      } else {
        final user = jsonDecode(response.body) as Map<String, dynamic>;
        return Right(user);
      }
    } catch (e) {
      return Left(AppFailure.custom(e.toString()));
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
