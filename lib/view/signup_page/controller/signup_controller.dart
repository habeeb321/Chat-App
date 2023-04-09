import 'dart:developer';

import 'package:chat_app/core/constants.dart';
import 'package:chat_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'The account already exists for the email');
      }
    } catch (e) {
      log(e.toString());
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
