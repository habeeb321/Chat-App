import 'package:chat_app/view/login_page/view/login_page.dart';
import 'package:chat_app/view/signup_page/view/signup_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin ? const LoginPage() : const SignUpPage();
  }
}
