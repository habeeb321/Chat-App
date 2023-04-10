import 'package:chat_app/core/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  void resetPassword(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showSnackbar(context, 'Password Reset Email Sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
      Navigator.pop(context);
    }
  }
}
