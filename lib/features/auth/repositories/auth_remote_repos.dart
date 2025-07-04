import 'dart:convert';

import 'package:fpdart/fpdart.dart' show Either, Left, Right;
import 'package:http/http.dart' as http;
import 'package:sales_reps/core/failure/failure.dart';
import 'package:sales_reps/features/auth/model/user_model.dart';

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

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        // handle error
        return Left(AppFailure.server(resBodyMap['detail']));
      } else {
        return Right(UserModel.fromMap(resBodyMap) as Map<String, dynamic>);
      }
    } catch (e) {
      return Left(AppFailure.custom(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> signin({
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
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return Left(AppFailure.server(resBodyMap['detail']));
      } else {
        return Right(UserModel.fromMap(resBodyMap));
      }
    } catch (e) {
      // Handle the error as needed
      return Left(AppFailure.custom(e.toString()));
    }
  }
}
