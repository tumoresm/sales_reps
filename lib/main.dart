import 'package:flutter/material.dart';
import 'package:sales_reps/core/theme/theme.dart';
import 'package:sales_reps/features/auth/view/pages/signup_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Reps',
      theme: AppTheme.darkThemeMode,
      home: const SignupPage(),
    );
  }
}
