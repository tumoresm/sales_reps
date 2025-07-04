import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sales_reps/core/theme/app_colours.dart';
import 'package:sales_reps/features/auth/repositories/auth_remote_repos.dart';
import 'package:sales_reps/features/auth/view/pages/signup_page.dart';
import 'package:sales_reps/features/auth/view/widgets/auth_button.dart';
import 'package:sales_reps/features/auth/view/widgets/custom_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              CustomField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 15.0),
              CustomField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20.0),
              AuthButton(
                buttonText: 'Sign In',
                onTap: () async {
                  final res = await AuthRemoteRepository().signin(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  final val = switch (res) {
                    Left(value: final l) => l,
                    Right(value: final r) => r,
                  };
                  print(val);
                },
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colours.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
